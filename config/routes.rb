Rails.application.routes.draw do
  #deviseユーザー（ログイン、新規登録）
  devise_for :users
  
  #home関係
  root 'homes#top'
  get 'homes/terms'#利用規約
  
  #ユーザー
  get 'users/bookmarks' =>'users#bookmarks', as: 'bookmarks'
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  #ホビー
  get 'hobbies/games' => 'hobbies#games', as: 'games'
  get 'hobbies/sports' => 'hobbies#sports', as: 'sports'
  get 'hobbies/movies' => 'hobbies#movies', as: 'movies'
  get 'hobbies/books' => 'hobbies#books', as: 'books'
  get 'hobbies/sightseeing' => 'hobbies#sightseeing', as: 'sightseeing'
  resources :hobbies, only: [:index, :show, :edit, :destroy, :create, :update] do
     resources :comments, only: [:create, :destroy] #hobbyにコメントをネスト
     resource :favorites, only: [:create, :destroy]
  end

  #検索
  get '/search', to: 'searchs#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
