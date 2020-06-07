Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
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
    resource :likes, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
  end
  
  resources :categories

end
