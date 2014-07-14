shared_examples 'an API class' do

  context 'default attributes' do

    it 'include httparty methods' do
      expect(subject).to include HTTParty
    end

    it 'have the base url set to the API endpoint' do
      expect(subject.base_uri).to eq base_uri
    end

    it 'use json format' do
      expect(subject.format).to eq format
    end
  end
end
