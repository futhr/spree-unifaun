module OneLinerExpectSyntax
  def expected
    expect(subject)
  end
  alias_method :is_expected, :expected
end

RSpec.configure do |config|
  config.include OneLinerExpectSyntax
end
