Rails.application.routes.draw do
  get '/search', to: 'songs#search'
  get '/songs/named/:name', to: 'songs#search_two'

  # Read all
  get '/songs', to: 'songs#index', as: :songs
  # Create
  get '/songs/new', to: 'songs#new', as: :new_song
  post '/songs', to: 'songs#create'
  # Read one
  get '/songs/:id', to: 'songs#show', as: :song
  # Update
  get '/songs/:id/edit', to: 'songs#edit', as: :edit_song
  patch '/songs/:id', to: 'songs#update'
  # Destroy
  delete '/songs/:id', to: 'songs#destroy'

  resources :songs do
    resources :reviews, only: [:new, :create]
  end
end
