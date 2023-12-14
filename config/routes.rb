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
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'reviews/index'
    get 'reviews/show'
    get 'platform_genres/index'
    get 'platform_genres/edit'
    get 'genres/index'
    get 'genres/edit'
    get 'game_works/new'
    get 'game_works/index'
    get 'game_works/show'
    get 'game_works/edit'
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
      get 'game_articles/index'
      get 'game_articles/show'
      get 'reviews/index'
      get 'reviews/show'
      get 'game_works/index'
      get 'game_works/show'
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
