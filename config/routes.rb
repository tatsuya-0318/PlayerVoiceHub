Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
    get 'game_articles/new'
    get 'game_articles/index'
    get 'game_articles/show'
    get 'game_articles/edit'
  end
  namespace :admin do
    get 'requests/index'
    get 'requests/show'
  end
  namespace :admin do
    get 'inquiries/index'
    get 'inquiries/show'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/show'
  end
  namespace :admin do
    get 'platform_genres/index'
    get 'platform_genres/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'game_works/new'
    get 'game_works/index'
    get 'game_works/show'
    get 'game_works/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'searches/index'
  end
  namespace :public do
    get 'requests/new'
    get 'requests/complete'
  end
  namespace :public do
    get 'inquiries/new'
    get 'inquiries/index'
    get 'inquiries/complete'
  end
  namespace :public do
    get 'game_articles/index'
    get 'game_articles/show'
  end
  namespace :public do
    get 'reviews/index'
    get 'reviews/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'game_works/index'
    get 'game_works/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
