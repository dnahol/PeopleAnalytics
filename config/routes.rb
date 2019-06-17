Rails.application.routes.draw do
  get 'banner_persons/index'

  root to: 'banner_persons#index'
  resources :banner_persons, only: [:index, :show, :update]

  get 'memberships' => 'memberships#index'

  get 'loyalty_points' => 'loyalty_points#index'
  get 'advisements' => 'advisements#index'
  get 'handouts' => 'handouts#index'
end
