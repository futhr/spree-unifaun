module OneLinerExpectSyntax
  def is_expected
    expect(subject)
  end
end

RSpec.configure do |config|
  config.include OneLinerExpectSyntax
end
