Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :order do
      resources :shipments
    end
  end
end
