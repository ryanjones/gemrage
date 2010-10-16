Gemrage::Application.routes.draw do
  # catching twitter/openid/facebook callbacks (omniauth)
  match '/auth/:provider/callback' => 'authentications#create', 
    :as => 'auth_callback'

  devise_for :users, :controllers => { :registrations => 'registrations' }

  resources :authentications

  root :to => "home#index"
end
