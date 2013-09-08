Shortslide::Application.routes.draw do

  get "welcome/index"
  resources :slides

  resources :templates do
    resources :template_attributes
  end

  root 'welcome#index'

end
