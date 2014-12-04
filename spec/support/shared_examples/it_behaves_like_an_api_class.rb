RSpec.shared_examples 'an API class' do

  context 'default attributes' do

    it 'includes HTTParty methods' do
      expect(subject).to include HTTParty
    end

    it 'has the base url set to the API endpoint' do
      expect(subject.base_uri).to eq base_uri
    end

    it 'uses json format' do
      expect(subject.format).to eq format
    end
  end
end
