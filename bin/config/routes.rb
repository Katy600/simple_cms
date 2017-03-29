Rails.application.routes.draw do

  get 'subjects/index'

  get 'subjects/show'

  get 'subjects/new'

  get 'subjects/edit'

  get 'subjects/delete'

  root 'demo#index'
  get 'demo/hello'
  get 'demo/index'
  get 'demo/other_hello'
  get 'demo/lynda'

  # get ':controller(/:action(/:id))'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end