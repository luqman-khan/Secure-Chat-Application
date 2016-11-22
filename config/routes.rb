Rails.application.routes.draw do
	devise_for :users, controllers: { registrations: 'users/registrations' }

	devise_scope :user do
		root "devise/sessions#new"
	end
	resource :welcomes do
		get 'welcome_page'
	end
  # get '/.well-known/acme-challenge/:id' => 'welcomes#letsencrypt'
end
