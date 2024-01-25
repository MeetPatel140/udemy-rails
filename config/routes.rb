Rails.application.routes.draw do

  root "movies#home"

  get "/about", to: "movies#about"
end
