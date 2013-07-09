require 'spec_helper'

describe Spree::Unifaun::Partner do
  context "validation" do
    it { should validate_presence_of :code }
    it { should validate_presence_of :partner }
  end
end
