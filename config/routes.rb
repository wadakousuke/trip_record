Rails.application.routes.draw do
  scope module: :public do
    resources :posts
    resources :users, only:[:update,:edit]
    get 'users/my_page' => "users#my_page", as:"my_page"
    get 'users/confirm' => "users#confirm", as:"confirm"
    patch 'users/withdraw' => "users#withdraw", as:"withdraw"
    root to:'homes#top'
    get 'homes/about'
  end
  namespace :admin do
    resources :posts, except:[:new, :create]
    resources :categories, only:[:update, :show, :index, :edit]
    resources :users, except:[:destroy, :create, :new]
    root to:'homes#top'
  end

  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
