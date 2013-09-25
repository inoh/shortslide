# coding: utf-8
Shortslide::Application.routes.draw do

  # テンプレート
  resources :templates do
    get 'preview'
  end

  # スライド
  resources :slides, :only => [:index, :new, :create] do
    resources :pages, :only => [:index, :new, :create]
  end

  get "welcome/index"
  root 'welcome#index'

end
