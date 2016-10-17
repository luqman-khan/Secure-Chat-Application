Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcomes#welcome_page"
  get '/.well-known/acme-challenge/:id' => 'welcomes#letsencrypt'
end
