Rails.application.routes.draw do
  resources :cards do
    get 'repeat', on: :member
  end

  root 'welcome#index'
end
