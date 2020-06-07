Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users do
    collection do
      get 'quit'
      patch 'out'
    end
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  resources :posts do
    resource :likes, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
  end
  
  resources :categories

end
