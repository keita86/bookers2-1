Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'homes#top'
    get "/home/about" => "homes#about"
  resources :users, only: [:show, :edit, :update, :index]
  resources :books

end
