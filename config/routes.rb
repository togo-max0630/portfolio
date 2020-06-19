Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  devise_for :users

  root 'homes#top'
  get 'homes/about'

  resources :users do
    collection do
      get 'quit'
      patch 'out'
    end
  end

  post 'follow/:id' => 'rerationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'rerationships#unfollow', as: 'unfollow' # フォロー外す
  get 'users/following/:user_id', to: 'users#following', as:'users_following'
  get 'users/follower/:user_id', to: 'users#follower', as:'users_follower'

  resources :posts do
    resources :comments, only:[:create, :destroy]
    resources :likes, only:[:create, :destroy]
  end 

  resources :groups do
    resources :messages, only:[:create, :destroy]
  end

  resources :categories
  resources :sub_categories


end
