Gemrage::Application.routes.draw do
  # catching twitter/openid/facebook callbacks (omniauth)
  match '/auth/:provider/callback' => 'authentications#create'

  devise_for :users

  root :to => "home#index"
end
