Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

   resources :orders, only: [ :index, :show, :new, :create] do
    post 'log'
    get 'thanx'
   end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  resources :genres, only: [ :index, :edit, :create, :update]
  resources :orders, only: [ :index, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
