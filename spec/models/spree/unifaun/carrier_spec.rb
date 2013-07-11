require 'spec_helper'

describe Spree::Unifaun::Carrier do

  let(:csv_file){ "/tmp/unifaun.test.csv" }
  let(:carrier) { Spree::Unifaun::Carrier.create(code: "DHL", name: "DHL-Express") }

  context "relation" do
    it { should have_many :carrier_services }
  end

  context "validation" do
    it { should validate_presence_of :code }
    it { should validate_presence_of :name }
  end

  context ".import_carriers" do
    it "should import carrier data from given csv file" do
      csv_data = "DHL; DHL express"
      File.write(csv_file, csv_data)
      expect { 
        Spree::Unifaun::Carrier.import_carriers(csv_file) 
      }.to change{ Spree::Unifaun::Carrier.count }.from(0).to(1)
    end   
  end

  context "#import_carrier_services" do
    it "should import carrier-services data from the given csv file" do
      csv_data   = ["Code;Service","ATSCSTD;ATS Cargo"].join("\n")
      File.write(csv_file, csv_data)      
      carrier.import_carrier_services(csv_file)
      carrier.carrier_services.first.code.should eq('ATSCSTD')
    end
  end

  context "#carrier_services_file" do
    it "should have the same name as the code" do
      carrier.carrier_services_file.split("/").last.should eq("dhl.csv")
    end
  end
end
