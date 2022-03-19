# == Route Map
#
#         Prefix Verb   URI Pattern                                                                                       Controller#Action
#                         new_user_session GET    /users/sign_in(.:format)                                                users/sessions#new
#   user_session POST   /users/sign_in(.:format)                                                                          users/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                               users/sessions#destroy
#                        new_user_password GET    /users/password/new(.:format)                                           devise/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                          devise/passwords#edit
#  user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
#                PUT    /users/password(.:format)                                                                         devise/passwords#update
#                POST   /users/password(.:format)                                                                         devise/passwords#create
#                 cancel_user_registration GET    /users/cancel(.:format)                                                 devise/registrations#cancel
#                    new_user_registration GET    /users/sign_up(.:format)                                                devise/registrations#new
#                   edit_user_registration GET    /users/edit(.:format)                                                   devise/registrations#edit
#                        user_registration PATCH  /users(.:format)                                                        devise/registrations#update
#                PUT    /users(.:format)                                                                                  devise/registrations#update
#                DELETE /users(.:format)                                                                                  devise/registrations#destroy
#                POST   /users(.:format)                                                                                  devise/registrations#create
#                    new_user_confirmation GET    /users/confirmation/new(.:format)                                       devise/confirmations#new
#                        user_confirmation GET    /users/confirmation(.:format)                                           devise/confirmations#show
#                POST   /users/confirmation(.:format)                                                                     devise/confirmations#create
#     home_index GET    /home/index(.:format)                                                                             home#index
#           root GET    /                                                                                                 home#index

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
