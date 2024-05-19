Rails.application.routes.draw do
  resources :author_scaffolds
  root "articles#index"

  resources :articles, :authors do
		resources :comments
  end
end
