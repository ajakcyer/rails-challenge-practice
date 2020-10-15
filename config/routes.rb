Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buildings, :companies
  post '/companies/:id', to: 'companies#new_employee', as: 'new_company_employee'
  delete '/companies', to: 'companies#delete_employee', as: 'delete_company_employee'

end
