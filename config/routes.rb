Rails.application.routes.draw do

  get 'vacancies/index'
  devise_for :users

  ActiveAdmin.routes(self)

  root 'vacancies#index'

  resources :positions
  resources :criteria
  resources :candidates
  resources :vacancies
  resources :position_criterium_scores
  resources :candidate_criterium_scores

  get "home/statistics"

  match '*path' => redirect('/'), via: :get

end
