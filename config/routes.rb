Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
    get 'game_articles/new'
    get 'game_articles/index'
    get 'game_articles/show'
    get 'game_articles/edit'
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
    get 'homes/top'
  end

  namespace :public do
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
    get 'users/show'
    get 'users/edit'
    get 'game_works/index'
    get 'game_works/show'
    get 'homes/top'
    get 'homes/about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
