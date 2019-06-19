Rails.application.routes.draw do
  get 'banner_persons/index'

  root to: 'banner_persons#index'
  resources :banner_persons, :advisements, only: [:index, :show, :update]

  get 'houses' => 'houses#index'
  get 'memberships' => 'memberships#index'
  get 'loyalty_points' => 'loyalty_points#index'



  get 'handouts' => 'handouts#index'
end
