module SpreeUnifaun
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_unifaun'

    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/models/spree/unifaun)

    initializer 'spree.unifaun.environment', before: :load_config_initializers do
      Spree::Unifaun::Config = Spree::UnifaunSetting.new
    end

    initializer 'spree.unifaun.ensure' do
      if !Rails.env.test? && Spree::Unifaun.configured?
        Spree::Unifaun.log 'All setup.'
      end
    end

    class << self
      def activate
        cache_klasses = %W(#{config.root}/app/**/*_decorator*.rb #{config.root}/app/overrides/*.rb)
        Dir.glob(cache_klasses) do |klass|
          Rails.configuration.cache_classes ? require(klass) : load(klass)
        end
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
