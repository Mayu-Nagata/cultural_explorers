Rails.application.routes.draw do

  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: "public/passwords"
  }

  devise_for :admin, skip: [:registrations, :passwords],　controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    patch 'end_users/withdraw' => 'end_users#withdraw'
    resources :end_users, only: [:index, :show, :update] do
      member do

        get :favorites
      end
    end
    get 'end_users/information/edit' => 'end_users#edit'
    #patch 'end_users/information' => 'end_users#update'

    resources :posts, only: [ :index, :new, :show, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end


  end

  scope module: :admin do
    get 'admin' => 'homes#top'

  end

  namespace :admin do

    resources :end_users, only: [ :index, :show, :edit, :update]
    resources :posts, only: [ :show, :destroy]
 end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
