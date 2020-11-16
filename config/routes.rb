Rails.application.routes.draw do
  root to: 'pages#home'
  resources :players, except: :show
  resources :battles, only: [:index, :new, :create, :show]
end
