Rails.application.routes.draw do
  resources :messages
  put 'messages' => "messages#index"
  resources :contacts
  resources :users do
  	member do
      get :confirm_email
    end
  end

	post 'auth_user' => 'authentication#authenticate_user'
	post 'get_salt' => 'authentication#get_salt'
	
	resource :welcomes do
		get 'welcome_page'
	end
  # get '/.well-known/acme-challenge/:id' => 'welcomes#letsencrypt'
end
