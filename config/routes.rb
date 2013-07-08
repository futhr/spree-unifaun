Spree::Core::Engine.routes.append do
  namespace :admin do
    # resources :unifaun
    # resources :products do
    #   get :related, on: :member
    #   resources :relations
    # end
    resources :order do 
      resources :shipments
    end
  end
end
