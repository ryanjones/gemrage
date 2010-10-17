Gemrage::Application.routes.draw do
  get "pages/home"

  # catching twitter/openid/facebook callbacks (omniauth)
  match '/auth/:provider/callback' => 'authentications#create',
    :as => 'auth_callback'

  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

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

  resources :payloads, :only => [:show, :update]
  resources :rubygems, :only => :show

  authenticate :user do
    get '/dashboard' => 'profiles#show', :as => :profile
  end

  get '/:handle' => 'profiles#public_profile', :as => :user_profile
  get '/:handle/gems' => 'profiles#public_gems', :as => :user_gems
  get '/:handle/:slug' => 'projects#show', :as => :user_project

  root :to => "pages#home"
end
