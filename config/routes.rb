Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
   resources :users do
  resources :tweets
end
resources :tweets do
  member do
    put "like", to: "tweets#upvote"
    put "dislike", to: "tweets#downvote"
  end
end

end
