describe Spree::Unifaun::CarrierService do

  context 'relation' do
    it { should belong_to :carrier }
    xit { should have_one :carrier_method }
  end

  context 'validation' do
    it { should validate_presence_of :code }
    it { should validate_presence_of :service }
  end
end
