# coding: utf-8
Shortslide::Application.routes.draw do

  # devise_for :users
  devise_for :users, :path => "", :path_names => {
    :sign_in => 'signin', :sign_out => 'signout', :password => 'password',
    :confirmation => 'verification',
    :unlock => 'unblock',
    :registration => 'signup'
  }, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # テンプレート
  resources :templates do
    get 'preview'
  end

  # スライド
  resources :slides do
    resources :pages, :only => [:index]
    resource :controls, :only => [:show, :create]
    get 'lock'
  end

  # 画像管理
  resources :images, :only => [:index, :create, :destroy]

  # 認証
  get "/sessions" => "sessions#index"
  get "/signout" => "sessions#destroy"

  # ウェルカム
  get "/welcome" => "welcome#index"

  root "welcome#index"

end
