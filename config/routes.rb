Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    	sessions: 'users/sessions' }
  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'search'
    end
  end
  resources :posts do
  	resources :post_comments, only: [:create, :destroy]
  	resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' #フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' #フォロー外す
end
