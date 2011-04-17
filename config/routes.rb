DieEwigeListe::Application.routes.draw do
  localized do
    resources :fixtures
    resources :matches
    resources :players
    root :to => "fixtures#index"
  end
end
