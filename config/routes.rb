Rails.application.routes.draw do
  #top
  root 'homes#top'

  get  'homes/select_position'=>'homes#select_position'
  get 'homes/select_position_E'=>'homes#select_position_E'
  get  'homes/select_position_K'=>'homes#select_position_K'
  get 'homes/sign_in'=>'homes#sign_in'
  get 'homes/about'=>'homes#about'
  #参加者ログイン
  get 'login' => 'user_sessions#new',as:'login'
  post 'users/login' => 'user_sessions#create',as:'login_create'
  delete 'logout' => 'user_sessions#destroy',as:'users_logout'
  #開催者ログイン
  get 'planners/login_form' => 'planner_sessions#new',as:'planners_login'
  post 'planners/login' => 'planner_sessions#create',as:'planners_login_create'
  delete 'logout' => 'planner_sessions#destroy',as:'planners_logout'
  #投稿
  get 'posts/index'=>'posts#index',as:'posts_index'
  get 'posts/new'=>'posts#new'
  post'posts/create'=>'posts#create',as:'posts_create'
  get 'posts/:id/update'=>'posts#update'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id'=>'posts#show'
  #参加者会員登録
get 'users/index' => 'users#index'
  get 'users/new'=>'users#new', as:'signup'
  post 'users/create'=>'users#create',as:'users'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  get 'users/:id' => 'users#show'
  
  
  #開催者会員登録
  get 'planners/new'=> 'planners#new'
  get 'planners/index'=>'planners#index',as:'planners_index'
  post'planners/create'=>'planners#create',as:'planners_create'
  get 'planeners/:id/edit' => 'planners#edit'
  post 'planners/:id/update' => 'planners#update'
  get 'planners/:id' => 'planners#show'
 
  #workshops投稿
  get 'workshops/index'=>'workshops#index'
  get 'workshops/new'=>'workshops#new',as:'workshops_new'
  get 'workshops/show'=> 'workshops#show'
  post 'workshops/create'=>'workshops#create',as:'workshops_create'
  #album
  get 'images/index'=>'images#index'
  get 'images/new'=>'images#new'
  post'images/create'=>'images#create', as: 'create_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
