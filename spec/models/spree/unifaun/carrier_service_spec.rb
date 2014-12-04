RSpec.describe Spree::Unifaun::CarrierService, type: :model do

  context 'relation' do
    it { is_expected.to belong_to(:carrier) }
    xit { is_expected.to have_one(:carrier_method) }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:service) }
  end
end
