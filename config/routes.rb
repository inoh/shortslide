Shortslide::Application.routes.draw do

  resources :templates

  resources :slides

  root 'welcome#index'

end
