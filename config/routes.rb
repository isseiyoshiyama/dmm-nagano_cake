Rails.application.routes.draw do

  scope module: :public do
    get "/customers/my_page" => "customers#show"
    get "/customers/edit" => "customers#edit"
    patch "/customers" => "customers#update"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"

    resources :items, only:[:index, :show]

    get "/cart_items" => "cart_items#index"
    patch "/cart_items/:id" => "cart_items#update"
    delete "/cart_items/:id" => "cart_items#destroy"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    post "/cart_items" => "cart_items#create"

    get "/orders/new" => "orders#new"
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"

    resources :addresses, only:[:index, :edit, :create, :update, :destroy]

  end





  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
      sessions:      'customers/sessions',
      passwords:     'customers/passwords',
      registrations: 'customers/registrations'
    }

  root to: 'homes#top'
  get "/about" => "homes#about"

  get "/admin" => "admin/homes#top"

  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end
end
