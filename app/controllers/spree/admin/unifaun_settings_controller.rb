module Spree
  module Admin
    class UnifaunSettingsController < ResourceController

      # save settings
      def update
        settings = Spree::UnifaunSetting.new
        params[:preferences].each do |k,v|
          settings[k] = v
        end
        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:settings, scope: :unifaun))
        render :edit
      end
    end
  end
end