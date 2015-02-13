RunningProject::Application.routes.draw do
  devise_for :runners, controllers: { registrations: 'registrations'}

  #resources :trainings
  root 'trainings#main'

  resources :runners do
    resources :trainings
    resources :shoes
  end

  resources :tipos

  get 'allshoes' => 'shoes#main', :as => 'allshoes'
  
end
