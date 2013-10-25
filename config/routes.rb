# coding: utf-8
Shortslide::Application.routes.draw do

  # テンプレート
  resources :templates do
    get 'preview'
  end

  # スライド
  resources :slides do
    resources :pages, :only => [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :images, :only => [:index, :create, :destroy]

  root 'slides#index'

end
