Rails.application.routes.draw do
  namespace :users do
    get 'posts/index'=>'posts#index',as:'posts_index'
    get 'posts/new'=>'posts#new',as:'posts_new'
    post 'workshops/:id/post' => 'posts#create', as: 'workshop_post'
    get 'posts/:id/edit' => 'posts#edit',as:'posts_edit'
    patch 'posts/:id/edit'=> 'posts#update',as:'posts_update'
    get 'posts/:id'=>'posts#show',as:'posts_show'
  end
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
    get '/mypage'=>'users#mypage',as:'mypage'
    get '/:id/edit' => 'users#edit',as:'edit'
    patch '/:id/edit'=>'users#update',as:'update'
    get '/:id' => 'users#show',as:'show'
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
    get '/:id/edit' => 'planners#edit',as:'edit'
    post '/:id/edit' => 'planners#update',as:'update'
    get '/:id' => 'planners#show',as:'show'
  end
  #top
  root 'homes#top'

  get  'homes/select_position'=>'homes#select_position',as:'homes_select_position'
  get 'homes/select_position_E'=>'homes#select_position_E'
  get  'homes/select_position_K'=>'homes#select_position_K'
  get 'homes/sign_in'=>'homes#sign_in',as:'home_sign_in'
  get 'homes/sign_up'=>'homes#sign_up',as:'home_sign_up'
  get 'homes/about'=>'homes#about'
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
  #get 'posts/:id'=>'posts#show',as:'posts_show'
  
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
    #user_workshop
    namespace :users do
      get'/workshops/index'=>'workshops#index',as:'workshops_index'
      get '/workshops/new'=>'workshops#new',as:'workshops_new'
      get '/workshops/:id/edit'=>'workshops#edit',as:'workshops_edit'
      patch '/workshops/:id/edit' => 'workshops#update',as:'workshops_update'
      get '/workshops/:id'=>'workshops#show',as:'workshops_show' 
    end
    namespace :users do
      get'/reservations/:workshop_id/new'=>'reservations#new',as:'reservations_new'
      get '/reservations/index'=>'reservations#index',as:'reservations_index'
      post'/reservations/:workshop_id/create'=>'reservations#create',as:'reservations_create'
      get '/reservations/:workshop_id/edit'=>'reservations#edit',as:'reservation_edit'
      post'/reservations/:workshop_id/edit' => 'reservations#update',as:'reservations_update'
      delete'/reservations/:workshop_id/edit' => 'reservations#destroy',as:'reservations_delete'
      get '/reservations/:workshop_id'=>'reservations#show',as:'reservations_show'
    end

    #post '/user_workshops/:workshop_id'=>'user_workshops#create',as:'create_user_workshop'
      #planner_workshops投稿
    namespace :planners do
      get '/workshops/index'=>'workshops#index',as:'workshops_index'
      post '/workshops/create'=>'workshops#create',as:'workshops_create'
      get '/workshops/new'=>'workshops#new',as:'workshops_new'
      get '/workshops/:id/edit' => 'workshops#edit',as:'workshops_edit'
      patch '/workshops/:id/edit' => 'workshops#update',as:'workshops_update'
      delete '/workshops/:id/edit' => 'workshops#destroy',as:'workshops_delete'
      get '/workshops/:id'=> 'workshops#show',as:'workshops_show'
      
    end

 
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
  #album
  get 'images/index'=>'images#index'
  get 'images/new'=>'images#new'
  post'images/create'=>'images#create', as: 'create_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
