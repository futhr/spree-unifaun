module Spree
  module Unifaun
    class Carrier < ActiveRecord::Base
      self.table_name = :spree_unifaun_carriers
      has_many :carrier_services, class_name: 'Spree::Unifaun::CarrierService'
      validates :code, :name, presence: true

      class << self
        def import_carriers(csv_file_path)
          require 'csv'
          CSV.foreach(csv_file_path, col_sep: ';') do |row|
            Spree::Unifaun::Carrier.where(code: row[0]).first_or_create(code: row[0], name: row[1]).save
          end
        end
      end

      # Imports carrier-services data from the given file
      def import_carrier_services(csv_file_path)
        require 'csv'
        new_services = []
        CSV.foreach(csv_file_path, col_sep: ';', headers: true) do |row|
          new_services << carrier_services.create(code: row[0], service: row[1])
        end
        self.carrier_services = new_services
      end

      # Gives the file path for the carrier-services file: db/data/#{code}.csv
      def carrier_services_file
        root_path = File.expand_path('../../../../../', __FILE__)
        File.join(root_path, 'db', 'data', "#{code.downcase}.csv")
      end
    end
  end
end
