# == Route Map
#
#         Prefix Verb   URI Pattern                                                                                       Controller#Action
#                         new_user_session GET    /users/sign_in(.:format)                                                users/sessions#new
#   user_session POST   /users/sign_in(.:format)                                                                          users/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                               users/sessions#destroy
#                        new_user_password GET    /users/password/new(.:format)                                           users/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                          users/passwords#edit
#  user_password PATCH  /users/password(.:format)                                                                         users/passwords#update
#                PUT    /users/password(.:format)                                                                         users/passwords#update
#                POST   /users/password(.:format)                                                                         users/passwords#create
#                 cancel_user_registration GET    /users/cancel(.:format)                                                 users/registrations#cancel
#                    new_user_registration GET    /users/sign_up(.:format)                                                users/registrations#new
#                   edit_user_registration GET    /users/edit(.:format)                                                   users/registrations#edit
#                        user_registration PATCH  /users(.:format)                                                        users/registrations#update
#                PUT    /users(.:format)                                                                                  users/registrations#update
#                DELETE /users(.:format)                                                                                  users/registrations#destroy
#                POST   /users(.:format)                                                                                  users/registrations#create
#                    new_user_confirmation GET    /users/confirmation/new(.:format)                                       users/confirmations#new
#                        user_confirmation GET    /users/confirmation(.:format)                                           users/confirmations#show
#                POST   /users/confirmation(.:format)                                                                     users/confirmations#create
#     home_index GET    /home/index(.:format)                                                                             home#index
#           root GET    /                                                                                                 home#index

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
