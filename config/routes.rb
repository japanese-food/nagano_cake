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


  scope module: :public do
    root 'homes#top'
    get 'about', to: 'homes#about'
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  
  namespace :admin do
     resources :genres, only: [ :index, :edit, :create, :update]
     resources :orders, only: [ :index, :show, :update]
  end


   namespace :admin do
    resources :products, only: [:index, :show, :edit, :new, :create, :update]
  end

  scope module: :public do
    resources :products, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy, :update, :destroy_all]
  end
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
