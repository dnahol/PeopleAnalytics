Rails.application.routes.draw do
  get 'banner_persons/index'

  root to: 'banner_persons#index'
  resources :banner_persons, only: [:index, :show, :update]
end
