Rails.application.routes.draw do
  devise_for :users

  resources :events, only: [:new, :show, :create, :edit, :update, :destroy]do
    member do
      get :liking_users
    end
  end

  resources :users, only: [:index, :show, :edit, :update]do
    member do
      get :like_events
    end
  end

  root 'home#top'
  get '/about' => 'home#about'

  post 'like/:event_id' => 'likes#like', as: 'like'
  delete 'unlike/:event_id' => 'likes#unlike', as: 'unlike'
end
