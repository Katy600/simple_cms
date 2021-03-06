Rails.application.routes.draw do

  root 'demo#index'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end


  get 'demo/hello'
  get 'demo/index'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'

  # get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
