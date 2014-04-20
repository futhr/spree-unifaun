module SpreeUnifaun
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_unifaun'

    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/models/spree/unifaun)

    initializer 'spree.unifaun.environment', before: :load_config_initializers do |app|
      Spree::Unifaun::Config = Spree::UnifaunSetting.new
    end

    initializer 'spree.unifaun.ensure' do
      if !Rails.env.test? && Spree::Unifaun.configured?
        Spree::Unifaun.log 'All setup.'
      end
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../../app/overrides/*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
