Rails.application.routes.draw do
  
  devise_for :users,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    root to: "homes#top"
    
    resources :game_articles, only: [:new, :create, :index, :show, :edit, :update]
    
    get 'requests/index'
    get 'requests/show'
    get 'inquiries/index'
    get 'inquiries/show'
    
    resources :users, only: [:index, :show, :edit, :update]
    
    resources :reviews, only: [:index, :show, :create, :update, :destroy]
    
    resources :platform_genres, only: [:new, :create, :index, :edit, :update]
    
    resources :genres, only: [:new, :create, :index, :edit, :update]

    resources :game_works, only: [:new, :create, :index, :show, :edit, :update]
  end
  
  
  scope module: :public do
      root to: "homes#top"
      get 'homes/about'
      
      get '/users/information/edit' => 'users#edit',as: 'users_edit'
      patch '/users/information' => 'users#update',as: 'users_update'
      get '/users/my_page' => 'users#show',as:'users_show'
      get '/users/check' => 'users#check'
      patch 'users/withdraw' => 'users#withdraw'
      post 'users/sign_out' => 'sessions#destroy'
      
      get 'searches/index'
      get 'requests/new'
      get 'requests/complete'
      get 'inquiries/new'
      get 'inquiries/index'
      get 'inquiries/complete'
      
      resources :game_articles, only: [:index, :show]
      
      get 'reviews/index'
      get 'reviews/show'
      
      resources :game_works, only: [:index, :show]
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
