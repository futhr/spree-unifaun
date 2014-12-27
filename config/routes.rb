Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :unifaun_settings, only: [:edit, :update]
  end
end
