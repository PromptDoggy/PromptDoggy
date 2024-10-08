Rails.application.routes.draw do
  root 'landing_page#index'

  # auth routes
  resources :users, only: [:create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  # openapi routes
  namespace :api do
    namespace :v1 do
      resources :projects, param: :token, only: [] do
        resources :environments, param: :token, only: [] do
          resources :prompts, only: [:index, :show], param: :name
          end
        end
    end
  end

  # console routes
  resources :projects, param: :token do
    resources :prompts do
      member do
        post 'deploy'
      end
    end
    resources :environments, param: :token
  end

  post 'copilots/prompts', to: 'copilots#prompts'

  get 'settings', to: 'settings#show'
end
