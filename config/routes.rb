Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/weather' => 'weather#index'
  get '/instructions' => 'instructions#index'
end
