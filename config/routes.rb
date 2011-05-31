DieEwigeListe::Application.routes.draw do
  localized do
    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" } do
      resources :groupscreated
    end
    resources :fixtures
    resources :matches
    resources :players
    resources :groups, :controller => "groupscreated"
    resources :groupscreated
    root :to => "fixtures#index"
  end
end
