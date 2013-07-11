require 'spec_helper'

describe Spree::Unifaun::CarrierMethod do
  context "relation" do
    it { pending "ToDo"; should belong_to :carrier_service }
  end

  context "validation" do
    it { pending "ToDo"; should validate_presence_of :code }
    it { pending "ToDo"; should validate_presence_of :name }
  end
end
