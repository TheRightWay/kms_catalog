Kms::Catalog::Engine.routes.draw do
  constraints(format: "json") do
    resources :categories, format: true do
      member do
        post '' => 'categories#update'
      end
    end
    resources :products, format: true do
      member do
        post '' => 'products#update'
      end
      resources :properties, format: true, only: [:index, :create, :update, :destroy]
      resources :option_types, format: true, only: [:index, :create, :destroy]
      resources :variants, format: true do
        resources :option_values, format: true
        member do
          get 'available_option_types'
          post '' => 'variants#update'
        end
      end
    end
    resources :option_types, format: true, only: :index
  end
end
