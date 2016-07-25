require 'api_version'

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # mount API::Base, at: '/'
  # mount GrapeSwaggerRails::Engine => '/docs'
  #
  # get 'secure' => 'secure#index'
  # get 'secure/logout' => 'secure#logout'


  if ENV['API_SUBDOMAIN']
    subdomain_constraint = { subdomain: ENV['API_SUBDOMAIN'].split(',') }
  else
    subdomain_constraint = {}
  end

  namespace :api, path: '/', constraints: subdomain_constraint do
    scope defaults: { format: 'json' } do
      scope module: :v1, constraints: ApiVersion.new('v1', true) do
        namespace :admin do
          resource :users, only: [:create]
        end
        namespace :user do 
          resource :users, only: [:create]
          resource :session, only: [:create]
          resources :votes, only: [:create, :show, :index, :update]
          resource :user_votes, only: [:create, :update]
          resource :forgot_password, only: [:create], controller: :forgot_password
          resource :request_forgot_password, only: [:create], controller: :request_forgot_password
        end
      end
    end
  end

end
