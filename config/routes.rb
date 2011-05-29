DieEwigeListe::Application.routes.draw do
  resources :groups

  #devise_for :users

  localized do
    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
    resources :fixtures
    resources :matches
    resources :players
    root :to => "fixtures#index"
  end
end
