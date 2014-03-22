require 'spec_helper'

describe Spree::Unifaun::Carrier do

  let(:csv_file) { '/tmp/unifaun.test.csv' }
  let(:carrier)  { described_class.create(code: 'DHL', name: 'DHL-Express') }

  context 'relation' do
    it { should have_many :carrier_services }
  end

  context 'validation' do
    it { should validate_presence_of :code }
    it { should validate_presence_of :name }
  end

  context '.import_carriers' do
    it 'import carrier data from given csv file' do
      csv_data = 'DHL; DHL express'
      File.write(csv_file, csv_data)
      expect {
        described_class.import_carriers(csv_file)
      }.to change(described_class, :count).from(0).to(1)
    end
  end

  context '#import_carrier_services' do
    it 'import carrier-services data from the given csv file' do
      csv_data   = ['Code;Service','ATSCSTD;ATS Cargo'].join("\n")
      File.write(csv_file, csv_data)
      carrier.import_carrier_services(csv_file)
      expect(carrier.carrier_services.first.code).to eq 'ATSCSTD'
    end
  end

  context '#carrier_services_file' do
    it 'have the same name as the code' do
      expect(carrier.carrier_services_file.split('/').last).to eq 'dhl.csv'
    end
  end
end
