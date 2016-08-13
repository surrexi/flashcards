Rails.application.routes.draw do
  resources :cards

  root 'welcome#index'
end
