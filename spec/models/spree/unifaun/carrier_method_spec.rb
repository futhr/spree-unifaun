require 'spec_helper'

describe Spree::Unifaun::CarrierMethod do

  context 'relation' do
    xit { should belong_to :carrier_service }
  end

  context 'validation' do
    xit { should validate_presence_of :code }
    xit { should validate_presence_of :name }
  end
end
