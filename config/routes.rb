Rails.application.routes.draw do
  #routes.rb

  resources :artigos

  root 'artigos#index' #artigos controller com a acao index que esta em controller/artigos_controller




end
