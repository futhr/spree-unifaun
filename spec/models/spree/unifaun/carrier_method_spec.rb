require 'spec_helper'

describe Spree::Unifaun::CarrierMethod do
  context "relation" do
    it { should belong_to :carrier_service }
  end

  context "validation" do
    it { should validate_presence_of :code }
    it { should validate_presence_of :name }
  end
end
