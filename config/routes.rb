Rails.application.routes.draw do
  root "articles#index"

  resources :articles, :authors do
		resources :comments
  end
end
