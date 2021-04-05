Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # フォローする
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  # フォロー外す
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get "follow_index" => "relationships#follow_index"
  get "follower_index" => "relationships#follower_index"

  root to: 'homes#top'
    get "/home/about" => "homes#about"
  resources :users, only: [:show, :edit, :update, :index]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
