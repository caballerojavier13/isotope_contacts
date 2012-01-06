IsotopeContacts::Engine.routes.draw do
  root :to => 'contacts#index'
  resources :contacts do
    resources :phone_numbers
    resources :emails
  end
end
