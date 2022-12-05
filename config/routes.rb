Rails.application.routes.draw do
  #top
  root 'homes#top'

  get  'homes/select_position'=>'homes#select_position',as:'homes_select_position'
  get 'homes/select_position_E'=>'homes#select_position_E'
  get  'homes/select_position_K'=>'homes#select_position_K'
  get 'homes/sign_in'=>'homes#sign_in',as:'home_sign_in'
  get 'homes/sign_up'=>'homes#sign_up',as:'home_sign_up'
  get 'homes/about'=>'homes#about'
  #参加者ログイン
  get 'login' => 'user_sessions#new',as:'login'
  post 'users/login' => 'user_sessions#create',as:'login_create'
  delete 'users/logout' => 'user_sessions#destroy',as:'users_logout'
  #開催者ログイン
  get 'planners/login_form' => 'planner_sessions#new',as:'planners_login'
  post 'planners/login' => 'planner_sessions#create',as:'planners_login_create'
  delete 'planners/logout' => 'planner_sessions#destroy',as:'planners_logout'
  #plannerフロフール写真
  get 'profiles/new'=>'profiles#new',as:'profile_new'
  post 'profiles/create'=>'profile#create',as:'profile_create'
  get 'profiles/update'=>'profiles#update'
  patch 'profiles/:id/edit'=>'profile_ps#edit',as:'profile_edit'
  #投稿
  get 'posts/index'=>'posts#index',as:'posts_index'
  get 'posts/new'=>'posts#new',as:'posts_new'
  post'posts/create'=>'posts#create',as:'posts_create'
  get 'posts/:id/edit' => 'posts#edit',as:'posts_edit'
  patch 'posts/:id/edit'=> 'posts#update',as:'posts_update'
  get 'posts/:id'=>'posts#show',as:'posts_show'
  
  #参加者会員登録
  get 'users/index' => 'users#index'
  get 'users/new'=>'users#new', as:'signup'
  post 'users/create'=>'users#create',as:'users'
  get 'users/mypage'=>'users#mypage',as:'users_mypage'
  get 'users/:id/edit' => 'users#edit',as:'users_edit'
  patch 'users/:id/edit'=>'users#update',as:'users_update'
  get 'users/:id' => 'users#show',as:'users_show'
  
  #開催者会員登録
  get 'planners/new'=> 'planners#new',as:'planners_new'
  get 'planners/index'=>'planners#index',as:'planners_index'
  post'planners/create'=>'planners#create',as:'planners_create'
  get 'planners/mypage'=>'planners#mypage',as:'planners_mypage'
  get 'planners/:id/edit' => 'planners#edit',as:'planners_edit'
  post 'planners/:id/edit' => 'planners#update',as:'planners_update'
  get 'planners/:id' => 'planners#show',as:'planners_show'
  #workshops投稿
  get 'workshops/index'=>'workshops#index',as:'workshops_index'
  get 'workshops/new'=>'workshops#new',as:'workshops_new'
  post 'workshops/create'=>'workshops#create',as:'workshops_create'
  get 'workshops/:id/review'=>'workhshops#review',as:'workshops_review'
  get 'workshops/:id/edit' => 'workshops#edit',as:'workshops_edit'
  patch 'workshops/:id/edit' => 'workshops#update',as:'workshops_update'
  get 'workshops/:id'=> 'workshops#show',as:'workshops_show'
  #album
  get 'images/index'=>'images#index'
  get 'images/new'=>'images#new'
  post'images/create'=>'images#create', as: 'create_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
