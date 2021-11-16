Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'

  get 'users/bookmarks' =>'users#bookmarks', as: 'bookmarks'
  resources :users, only: [:show, :edit, :update]

  get 'hobbies/games' => 'hobbies#games', as: 'games'
  get 'hobbies/sports' => 'hobbies#sports', as: 'sports'
  get 'hobbies/movies' => 'hobbies#movies', as: 'movies'
  get 'hobbies/books' => 'hobbies#books', as: 'books'
  get 'hobbies/sightseeing' => 'hobbies#sightseeing', as: 'sightseeing'
  resources :hobbies, only: [:index, :show, :edit, :destroy, :create, :update] do
     resources :comments, only: [:create, :destroy] #hobbyにコメントをネスト
     resource :favorites, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
