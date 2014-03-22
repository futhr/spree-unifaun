RSpec::Matchers.define :have_text_like do |expected|
  match do |actual|
    have_text %r{#{expected}}iu
  end
  failure_message_for_should do |actual|
    "expected that text would exist with '#{expected}'"
  end
end