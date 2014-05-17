describe Spree::Unifaun::CarrierMethod do

  context 'relation' do
    xit { is_expected.to belong_to :carrier_service }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :name }
  end
end
