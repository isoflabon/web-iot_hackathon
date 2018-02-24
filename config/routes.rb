Rails.application.routes.draw do
  root 'top#index'

  get "/requests/:request_id", to: "sounds#recieve_and_inspect"
  get "/sound/", to: "sounds#get_sound"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
