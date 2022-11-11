Rails.application.routes.draw do
  get 'songs', to: 'songs#index'
  post 'songs', to: 'songs#create'

  get '/search', to: 'songs#search'
  get '/songs/named/:name', to: 'songs#search_two'
end
