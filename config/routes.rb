Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  match 'products' => 'home#products', :as => :products
  match 'about_us' => 'home#about_us', :as => :about_us
  match 'contact_us' => 'home#contact_us', :as => :contact_us
  match 'dashboard' => 'dashboard#index', :as => :dashboard
  match 'pages_list' => 'dashboard#pages_list', :as => :pages_list
  match 'send_to_analytics' => 'visits#send_to_analytics', :as => :send_to_analytics

end