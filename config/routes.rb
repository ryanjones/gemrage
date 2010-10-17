Gemrage::Application.routes.draw do
  get "pages/home"

  # catching twitter/openid/facebook callbacks (omniauth)
  match '/auth/:provider/callback' => 'authentications#create',
    :as => 'auth_callback'

  devise_for :users, :controllers => { :registrations => 'registrations' }

  resources :authentications

  namespace :api do
    namespace :v1 do
      resource :payload, :only => [] do
        member do
          post 'system'
          post 'project'
        end
      end
    end
  end

  resources :payloads

  authenticate :user do
    resource :profile
  end

  root :to => "home#index"
end
