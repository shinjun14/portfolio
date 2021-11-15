Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'

  resources :users, only: [:show, :edit, :update]

  get 'hobbies/games' => 'hobbies#games', as: 'games'
  get 'sports' => 'hobbies#sports', as: 'sports'
  get 'movies' => 'hobbies#movies', as: 'movies'
  get 'books' => 'hobbies#books', as: 'books'
  get 'sightseeing' => 'hobbies#sightseeing', as: 'sightseeing'

  resources :hobbies, only: [:index, :show, :edit, :destroy, :create, :update] do
     resources :comments, only: [:create, :destroy] #hobbyにコメントのアソシエーション
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
