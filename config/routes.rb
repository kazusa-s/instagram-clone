Rails.application.routes.draw do
  # root to: 'home#index'
  root to: 'posts#index'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                 registrations: 'registrations' }

  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: redirect("/users/sign_up")

  get '/posts', to: 'posts#search_result', as: 'search_result'

  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :comments, only: %i(create destroy)
    resources :likes, only: %i(create destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
