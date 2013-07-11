# coding: utf-8
require 'csv'

namespace :unifaun do
  desc 'Import Unifaun partners'
  task import_partners: :environment do
    csv_file = File.expand_path("../../../db/data/partners.csv", __FILE__)
    Spree::Unifaun::Carrier.import_carriers(csv_file) 
  end

  desc "Import Unifaun carrier-services for each carrier"
  task import_carrier_services: :environment do
    errors = []
    Spree::Unifaun::Carrier.all.each do |carrier|
      begin
        carrier.import_carrier_services(carrier.carrier_services_file)
      rescue => e
        errors << e.message
      end
    end
    unless errors.empty?
      puts "Done with errors:"
      errors.map{|e| puts e}
    end
  end

end
