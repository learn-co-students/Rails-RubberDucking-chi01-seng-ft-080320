Rails.application.routes.draw do
  resources :ducks, except: [:destroy]
  resources :students, except: [:destroy]
end
