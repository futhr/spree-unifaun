require 'spree_core'
require 'spree_unifaun/version'
require 'spree_unifaun/engine'
require 'coffee_script'
require 'httparty'
require 'excon'

module Spree
  module Unifaun
    extend self

    def config(&block)
      yield(Spree::Unifaun::Config)
    end

    def log(message)
      Rails.logger.info "spree_unifaun: #{message}"
    end

    def configured?
      Config.key.present?
    end

    def merge_vars(model)
      array = Config.merge_vars.map do |tag, method|
        [tag, model.send(method).to_s]
      end
      Hash[array]
    end
  end
end