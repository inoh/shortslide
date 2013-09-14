# coding: utf-8
Shortslide::Application.routes.draw do

  # テンプレート
  resources :templates do
    get 'preview'
  end

  # スライド
  resources :slides

  get "welcome/index"
  root 'welcome#index'

end
