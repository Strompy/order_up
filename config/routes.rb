Rails.application.routes.draw do
  get '/dish/:id', to: 'dishes#show'
end
