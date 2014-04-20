module Spree
  module Admin
    class UnifaunSettingsController < ResourceController

      def update
        settings = Spree::UnifaunSetting.new
        params.each do |name, value|
          next unless settings.has_preference? name
          settings[name] = value
        end
        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:settings, scope: :unifaun))
        redirect_to edit_admin_unifaun_settings_path
      end
    end
  end
end