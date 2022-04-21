Rails.application.routes.draw do

  scope module: :public do
    resource :customers, only: [:show, :edit, :update,]
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/out' => 'customers#out', as: 'out'
  end



  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
