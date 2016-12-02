Rails.application.routes.draw do
  resources :messages
  put 'messages' => "messages#index"
  resources :contacts
	devise_for :users, controllers: { registrations: 'users/registrations' }
	post 'auth_user' => 'authentication#authenticate_user'
	devise_scope :user do
		root "devise/sessions#new"
	end
	resource :welcomes do
		get 'welcome_page'
	end
  # get '/.well-known/acme-challenge/:id' => 'welcomes#letsencrypt'
end
