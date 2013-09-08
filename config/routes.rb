Shortslide::Application.routes.draw do

  resources :slides

  resources :templates do
    resources :template_attributes
  end

  root 'welcome#index'

end
