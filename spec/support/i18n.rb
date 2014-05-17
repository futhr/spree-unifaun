require 'rspec'
require 'i18n-spec'

RSpec.configure do |config|

  def with_locale(*args, &block)
    I18n.with_locale(*args, &block)
  end

  config.around(:each, :en) do |example|
    with_locale(:en) do
      example.run
    end
  end

  config.around(:each, :sv) do |example|
    with_locale(:sv) do
      example.run
    end
  end

  config.before(:suite) do
    I18n.locale = :en
  end

  config.after(type: :feature) do
    pattern = /translation missing: #{I18n.locale}\.(.*?)[\s<\"&]/
    missing = page.body.scan(pattern)
    if missing.any?
      puts "\e[1m\e[35mFound missing translations: #{missing.inspect}\e[0m"
      puts "\e[1m\e[35mIn spec: #{example.location}\e[0m"
    end
  end
end
