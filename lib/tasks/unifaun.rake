# coding: utf-8
require 'csv'

namespace :unfaun do
  desc 'Import Unifaun partners'
  task import_partners: :environment do
    csv_file_path = Dir.glob(File.join(File.dirname(__FILE__), '../../db/data/partners.csv'))

    CSV.foreach(csv_file_path) do |row|
      row = Spree::UnifaunPartner.
        where(code: row[0]).
        first_or_create(code: row[0], partner: row[1]).
        save

      puts "#{row[1]} added!"
    end
  end
end
