Rails.application.routes.draw do

  scope module: :public do
    resource :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/out' => 'customers#out', as: 'out'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
  end



  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
    resources :orders, only: [ :index, :show, :new, :create] do
     post 'log'
     get 'thanx'
    end
  end

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
    resources :cart_items, only: [:index, :create, :destroy, :update,] do
       collection do
        delete 'destroy_all'
      end
    end
    resources :products, only: [:index, :show]

end

    resources :cart_items, only: [:index, :create, :destroy, :update, :destroy_all]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
