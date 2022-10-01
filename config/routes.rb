Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  ActiveAdmin.routes(self)

  get 'vacancies/index'

  root 'candidates#index'

  resources :positions
  resources :criteria
  resources :candidates
  resources :vacancies
  resources :position_criterium_scores
  resources :candidate_criterium_scores

  get "home/statistics"

  match '*path' => redirect('/'), via: :get

end
