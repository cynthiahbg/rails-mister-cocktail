Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'cocktails#index'

  get 'cocktails', to: 'cocktails#index'
  post 'cocktails', to: 'cocktails#create'
  get 'cocktails/new', to: 'cocktails#new', as: :new_cocktail
  get 'cocktails/:id', to: 'cocktails#show', as: :cocktail

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    # resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]

  # get '/cocktails/:cocktail_id/doses', to: 'doses#index'
  # post '/cocktails/:cocktail_id/doses', to: 'doses#create', as: :cocktail_doses
  # get '/cocktails/:cocktail_id/doses/new', to: 'doses#new', as: :new_cocktail_dose
  # get '/cocktails/:cocktail_id/doses/:id', to: 'doses#show', as: :dose
  # delete 'doses/:id', to: 'doses#destroy'
end

# A user can see the list of cocktails
# GET "cocktails"

# A user can see the details of a given cocktail, with the dose needed for each ingredient
# GET "cocktails/42"

# A user can create a new cocktail
# GET "cocktails/new"
# POST "cocktails"

# A user can add a new dose (ingredient/description pair) to an existing cocktail
# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"
# A user can delete a dose that belongs to an existing cocktail. How can we make a delete link again?
# DELETE "doses/25"

# Prefix Verb URI Pattern                               Controller#Action

#            root GET  /                                cocktails#index
#       cocktails GET  /cocktails(.:format)             cocktails#index
#                 POST /cocktails(.:format)             cocktails#create
#    new_cocktail GET  /cocktails/new(.:format)         cocktails#new
#        cocktail GET  /cocktails/:id(.:format)         cocktails#show
