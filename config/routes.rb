Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords],　controllerscontrollerscontrollers: {
    sessions: "admin/sessions"
  }
  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: "public/passwords"
  }


  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    patch 'end_users/withdraw' => 'end_users#withdraw'
    resources :end_users, only: [:index, :show, :update]
    get 'end_users/information/edit' => 'end_users#edit'
    #patch 'end_users/information' => 'end_users#update'

    resources :posts, only: [ :index, :new, :show, :create, :destroy]
    resources :likes, only: [ :index]

  end

  namespace :public do
   #get 'end_users' => 'end_users#index'
    #get 'end_users/:id' => 'end_users#show'
    #get 'end_users/information/edit' => 'end_users#edit'
    #patch 'end_users/information' => 'end_users#update'
    #get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    #patch 'end_users/withdraw' => 'end_users#withdraw'
    #resources :posts, only: [ :index, :new, :show, :create, :destroy]
    #resources :likes, only: [ :index]
  end

  namespace :admin do
    get 'admin' => 'homes#top'
    resources :end_users, only: [ :index, :show, :edit, :update]
    resources :posts, only: [ :show, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
