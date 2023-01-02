Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords],　controllerscontrollerscontrollers: {
    sessions: "admin/sessions"
  }
  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: "public/passwords"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
