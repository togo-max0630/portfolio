Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users do
    collection do
      get 'quit'
      patch 'out'
        resources :rerationships
          member do 
            post 'follow'
            post 'unfollow'
          end
        resources :category
  end

  resources :posts do
    resource :likes, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
  end

end
