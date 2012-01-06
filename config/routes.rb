IsotopeContacts::Engine.routes.draw do
  resources :contacts do
    resources :phone_numbers
    resources :emails
  end
end
