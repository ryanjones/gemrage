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
  resources :rubygems, :only => :show

  authenticate :user do
    resource :profile
  end

  get '/:handle' => 'profiles#public_profile', :as => :user_profile
  get '/:handle/gems' => 'profiles#public_gems', :as => :user_gems
  get '/:handle/:slug' => 'projects#show', :as => :user_project

  root :to => "home#index"
end