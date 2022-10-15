Rails.application.routes.draw do


  get 'sessions/new'
  #top
  root 'home#top'

  get 'home/select_position'=>'home#select_position'
  get 'home/select_position_E'=>'home#select_position_E'
  get 'home/select_position_K'=>'home#select_position_K'
  get 'home/about'=>'home#about'
    #参加者ログイン
    get 'login' => 'users#login_form',as:'login'
    post 'login' => 'users#login',as:'login_create'
    post 'logout' => 'users#logout'
   #開催者ログイン
   get 'planners/login_form' => 'planners#login_form',as:'planners_login'
   post 'planners/login' => 'planners#login',as:'planners_login_create'
   post 'logout' => 'planners#logout'

   get 'posts/index'=>'posts#index'
   get 'posts/new'=>'posts#new'
   get 'posts/:id'=>'posts#show'
   post'posts/create'=>'posts#create'
   get 'posts/:id/update'=>'posts#update'
   get 'posts/:id/edit' => 'posts#edit'
   delete 'posts/:id/destroy'=>'posts#destroy'
  ##参加者会員登録
  get "users/index" => "users#index"
  get 'users/new'=>'users#new', as:'signup'
  post 'users/create'=>'users#create',as:'users'
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  #開催者会員登録
  get 'planners/new'=> 'planners#new'
  get 'planners/index'=>'planners#index',as:'planners_index'
  post'planners/create'=>'planners#create',as:'planners_create'
  get 'planners/:id' => 'planners#show'
  get 'planeners/:id/edit' => 'planners#edit'
  post 'planners/:id/update' => 'planners#update'
  #album
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
