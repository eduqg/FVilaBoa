Rails.application.routes.draw do
  devise_for :usuarios
  #routes.rb

  resources :artigos do
  	resources :comentarios
  end

  root 'artigos#index' #artigos controller com a acao index que esta em controller/artigos_controller
  get 'sobre' => 'artigos#sobre'


end
