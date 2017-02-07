Rails.application.routes.draw do
  root to:"my_contacts#index"

  get "/my_contacts", to: "my_contacts#index"
  get "/my_contacts/new", to: "my_contacts#new"
  post "/my_contacts", to: "my_contacts#create"
  get "/my_contacts/:id", to: "my_contacts#show"
  get "/my_contacts/:id/edit", to: "my_contacts#edit"
  patch "/my_contacts/:id", to: "my_contacts#update"
  delete "/my_contacts/:id", to: "my_contacts#destroy"

  get "/my_contacts/all_Johns", to: "my_contacts#johns"

  #sign-up

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  #login/out

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"


end
