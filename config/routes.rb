Rails.application.routes.draw do
  namespace :admin do
    get 'posts/index'
    get 'posts/edit'
    get 'posts/show'
  end
  namespace :admin do
    get 'categories/index'
    get 'categories/edit'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/edit'
    get 'posts/show'
  end
  devise_for :admins
  devise_for :users
  get 'homes/top'
  get 'homes/bout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
