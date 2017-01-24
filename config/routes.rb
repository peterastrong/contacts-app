Rails.application.routes.draw do
  get "first_contact", to: "my_contacts#first_contact_method"
  get "all_contacts", to: "my_contacts#all_contacts_method"

  get "/new_contact_form", to: "my_contacts#new_contact_method"
  post "/new_contact_result", to: "my_contacts#new_contact_result_method"

  root to:"my_contacts#index"

  get "/my_contacts", to: "my_contacts#index"
  get "/my_contacts/new", to: "my_contacts#new"
  post "/my_contacts", to: "my_contacts#create"
  get "/my_contacts/:id", to: "my_contacts#show"
  get "/my_contacts/:id/edit", to: "my_contacts#edit"
  patch "/my_contacts/:id", to: "my_contacts#update"
  delete "/my_contacts/:id", to: "my_contacts#destroy"


end
