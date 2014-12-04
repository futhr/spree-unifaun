RSpec.configure do |config|

  config.before(:suite) do
    I18n.locale = :en
  end

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
end
