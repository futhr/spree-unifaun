Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :orders do
      resources :shipments, only: [:index, :edit]
    end
    resource :unifaun_settings, only: [:edit, :update]
  end
end
