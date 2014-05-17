describe Spree::Unifaun::Partner do

  context 'validation' do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :partner }
  end
end
