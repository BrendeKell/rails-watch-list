Rails.application.routes.draw do
  resources :lists, only: [:show, :index, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
