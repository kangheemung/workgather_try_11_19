Rails.application.routes.draw do

 #top
 root 'homes#top'

 get  'homes/select_position'=>'homes#select_position',as:'homes_select_position'
 get 'homes/select_position_E'=>'homes#select_position_E'
 get  'homes/select_position_K'=>'homes#select_position_K'
 get 'homes/sign_in'=>'homes#sign_in',as:'home_sign_in'
 get 'homes/sign_up'=>'homes#sign_up',as:'home_sign_up'
 get 'homes/about'=>'homes#about'
  namespace :users do
      #参加者ログイン
      get '/login_form' => 'user_sessions#new',as:'login'
      post '/login' => 'user_sessions#create',as:'login_create'
      delete '/logout' => 'user_sessions#destroy',as:'logout'
  end
  namespace :users do
    #参加者会員登録
    get '/index' => 'users#index',as:'index'
    get '/new'=>'users#new',as:'signup'
    post '/create'=>'users#create',as:'create'
    get '/:user_id/edit' => 'users#edit',as:'edit'
    patch '/:user_id/edit'=>'users#update',as:'update'
    get '/:user_id'=>'users#show',as:'show'
  end  
  namespace :planners do
    #開催者ログイン
    get '/login_form' => 'planner_sessions#new',as:'login'
    post '/login' => 'planner_sessions#create',as:'login_create'
    delete '/logout' => 'planner_sessions#destroy',as:'logout'
  end
  namespace :planners do
    #開催者会員登録
    get '/new'=> 'planners#new',as:'new'
    get '/index'=>'planners#index',as:'index'
    post'/create'=>'planners#create',as:'create'
    get '/mypage'=>'planners#mypage',as:'mypage'
    get '/:planner_id/edit' => 'planners#edit',as:'edit'
    post '/:planner_id/edit' => 'planners#update',as:'update'
    get '/:planner_id' => 'planners#show',as:'show'
  end
       #planner_workshops投稿
  namespace :planners do
    get '/workshops/index'=>'workshops#index',as:'workshops_index'
    post '/workshops/create/:planner_id'=>'workshops#create',as:'workshops_create'
    get '/workshops/:planner_id/new'=>'workshops#new',as:'workshops_new'
    get '/workshops/:planner_id/:workshop_id/edit' => 'workshops#edit',as:'workshops_edit'
    patch '/workshops/:planner_id/:workshop_id/edit' => 'workshops#update',as:'workshops_update'
    delete '/workshops/:planner_id/:workshop_id/edit' => 'workshops#destroy',as:'workshops_delete'
    get '/workshops/:planner_id/:workshop_id'=> 'workshops#show',as:'workshops_show' 
  end
  namespace :planners do
    get 'posts/:workshop_id/:post_id/index'=>'posts#index',as:'posts_index'
  end
  namespace :planners do
    get 'reservations/:workshop_id/index'=>'reservations#index',as:'reservations_index'
  end
  namespace :users do
    #レビュー
    get 'posts/index'=>'posts#index',as:'posts_index'
    get '/:workshop_id/new'=>'posts#new',as:'posts_new'
    post '/:user_id/workshops/:workshop_id/post' => 'posts#create', as: 'workshop_post'
    get 'posts/:post_id/edit' => 'posts#edit',as:'posts_edit'
    patch 'posts/:post_id/edit'=> 'posts#update',as:'posts_update'
    get 'posts/:post_id'=>'posts#show',as:'posts_show'
  end
 
    #user_workshop
    namespace :users do
      get'/workshops/index'=>'workshops#index',as:'workshops_index'
      get '/:workshop_id/new'=>'workshops#new',as:'workshops_new'
      get '/workshops/:u_workshop_d/edit'=>'workshops#edit',as:'workshops_edit'
      patch '/workshops/:u_workshop_id/edit' => 'workshops#update',as:'workshops_update'
      get '/user_id/workshops/:workshop_id'=>'workshops#show',as:'workshops_show' 
    end
    namespace :users do
      get'/:user_id/workshop/:workshop_id/reservations/new'=>'reservations#new',as:'reservations_new'
      get '/:user_id/reservations/index'=>'reservations#index',as:'reservations_index'
      post'/:user_id/workshops/:workshop_id/create'=>'reservations#create',as:'reservations_create'
      get '/reservations/:user_id/:reservation_id/edit'=>'reservations#edit',as:'reservations_edit'
      patch'/reservations/:user_id/:reservation_id/edit' => 'reservations#update',as:'reservations_update'
      delete'/reservations/:user_id/edit' => 'reservations#destroy',as:'reservations_delete'
      get '/:user_id/:reservation_id'=>'reservations#show',as:'reservations_show'
    end

    #post '/user_workshops/:workshop_id'=>'user_workshops#create',as:'create_user_workshop'


 
  #workshops投稿
  #get 'workshops/index'=>'workshops#index',as:'workshops_index'
  #get 'workshops/new'=>'workshops#new',as:'workshops_new'
  #post 'workshops/create'=>'workshops#create',as:'workshops_create'
  #get 'workshops/:id/edit' => 'workshops#edit',as:'workshops_edit'
  #patch 'workshops/:id/edit' => 'workshops#update',as:'workshops_update'
  #get 'workshops/:id'=> 'workshops#show',as:'workshops_show'
  # reservations予約ページ
  #get '/reservations/index'=>'reservations#index'
  #get 'reservations/new' =>'reservations#new'
  #post'reservations/create'=>'reservations#create'
  #get 'reservations/:id/edit'=>'reservations#edit'
  #patch 'reservations/:id/edit' => 'reservations#update'
  #get 'reservations/:id'=>'reservations#show'
  #get  '/reservations' => 'reservations#index',as:'book_reservations_index'
   #参加者ログイン
  #get 'login' => 'user_sessions#new',as:'login'
  #post 'users/login' => 'user_sessions#create',as:'login_create'
  #delete 'users/logout' => 'user_sessions#destroy',as:'users_logout'
  #開催者ログイン
 # get 'planners/login_form' => 'planner_sessions#new',as:'planners_login'
  #post 'planners/login' => 'planner_sessions#create',as:'planners_login_create'
  #delete 'planners/logout' => 'planner_sessions#destroy',as:'planners_logout'
 
  #投稿
  #get 'posts/index'=>'posts#index',as:'posts_index'
  #get 'posts/new'=>'posts#new',as:'posts_new'
  #post 'workshops/:id/post' => 'posts#create', as: 'workshop_post'
  #get 'posts/:id/edit' => 'posts#edit',as:'posts_edit'
  #patch 'posts/:id/edit'=> 'posts#update',as:'posts_update'
  get 'planners/posts/:workshop_id'=>'posts#show',as:'posts_show'
  
  #参加者会員登録
  #get 'users/index' => 'users#index'
  #get 'users/new'=>'users#new', as:'signup'
  #post 'users/create'=>'users#create',as:'users'
  #get 'users/mypage'=>'users#mypage',as:'users_mypage'
  #get 'users/:id/edit' => 'users#edit',as:'users_edit'
  #patch 'users/:id/edit'=>'users#update',as:'users_update'
  #get 'users/:id' => 'users#show',as:'users_show'
  
  #開催者会員登録
  #get 'planners/new'=> 'planners#new',as:'planners_new'
  #get 'planners/index'=>'planners#index',as:'planners_index'
  #post'planners/create'=>'planners#create',as:'planners_create'
  #get 'planners/mypage'=>'planners#mypage',as:'planners_mypage'
  #get 'planners/:id/edit' => 'planners#edit',as:'planners_edit'
  #post 'planners/:id/edit' => 'planners#update',as:'planners_update'
  #get 'planners/:id' => 'planners#show',as:'planners_show'
  #album

  get 'images/index'=>'images#index'
  get 'images/new'=>'images#new'
  post'images/create'=>'images#create', as: 'create_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end

