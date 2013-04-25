NewsViewer::Application.routes.draw do
  get 'tweets/index'
  get 'tweets/fetch'
  get 'tweets/favorites'
  post 'tweets/toggle_favorite'

  root :to => 'tweets#index'
end
