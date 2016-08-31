Rails.application.routes.draw do
  resources :cards do
    post 'check_card', on: :collection
  end

  root 'welcome#index'
end
