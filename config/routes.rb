Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "process/*other", to: "request#index"
  post "process/*other", to: "request#index"
  put "process/*other", to: "request#index"
  delete "process/*other", to: "request#index"

  get "process/", to: "request#index"
  post "process/", to: "request#index"
  put "process/", to: "request#index"
  delete "process/", to: "request#index"

  get "stats", to: "request#stats"
end
