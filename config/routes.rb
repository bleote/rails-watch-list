Rails.application.routes.draw do
  root to: 'movies#home'
  resources :movies, only: %i[index show]
  resources :lists, only: %i[index show new create destroy] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
end
