# coding: utf-8
Shortslide::Application.routes.draw do

  # テンプレート
  resources :templates do
    get 'preview'
  end

  # スライド
  resources :slides do
    resources :pages, :only => [:index]
    resource :controls, :only => [:show, :create]
  end

  # 画像管理
  resources :images, :only => [:index, :create, :destroy]

  # 認証
  get "/sessions" => "sessions#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy"

  # トップページ
  get "/welcome" => "welcome#index"

  root 'welcome#index'

end
