FriendshipCircle::Application.routes.draw do
  resources :users do
    get 'reset'
    get 'activate'
    resources :friend_circles, :shallow => true

    resources :posts, :shallow => true do
      resources :links
    end
  end

  resource :session

end
