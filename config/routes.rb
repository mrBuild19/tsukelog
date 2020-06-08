Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    	sessions: 'users/sessions' }
  resources :users, only: [:show, :edit, :update] do
  	member do
  		get :following, :followers
  	end
  end
  resources :posts do
  	resources :post_comments, only: [:create, :destroy]
  	resource :likes, only: [:create, :destroy]
  end
end
