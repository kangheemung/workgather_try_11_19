Rails.application.routes.draw do

 #top
 root 'homes#top'

 get 'homes/select_position'=>'homes#select_position',as:'homes_select_position'
 get 'homes/select_position_E'=>'homes#select_position_E'
 get 'homes/select_position_K'=>'homes#select_position_K'
 get 'homes/sign_in'=>'homes#sign_in',as:'home_sign_in'
 get 'homes/sign_up'=>'homes#sign_up',as:'home_sign_up'
 get 'homes/about'=>'homes#about'
  
 

 
  namespace :planners do
    #開催者ログイン
    get '/login_form' => 'planner_sessions#new',as:'login'
    post '/login' => 'planner_sessions#create',as:'login_create'
    delete '/logout' => 'planner_sessions#destroy',as:'logout'
    #開催者会員登録
    get '/new'=> 'planners#new',as:'new'
    get '/index'=>'planners#index',as:'index'
    post'/create'=>'planners#create',as:'create'
    get '/mypage'=>'planners#mypage',as:'mypage'
    get '/:planner_id/edit' => 'planners#edit',as:'edit'
    post '/:planner_id/edit' => 'planners#update',as:'update'
    get '/:planner_id' => 'planners#show',as:'show'
      #planner_workshops投稿
    get '/workshops/index'=>'workshops#index',as:'workshops_index'
    post '/workshops/create/:planner_id'=>'workshops#create',as:'workshops_create'
    get '/workshops/:planner_id/new'=>'workshops#new',as:'workshops_new'
    get '/workshops/:planner_id/:workshop_id/edit' => 'workshops#edit',as:'workshops_edit'
    patch '/workshops/:planner_id/:workshop_id/edit' => 'workshops#update',as:'workshops_update'
    delete '/workshops/:planner_id/:workshop_id/edit' => 'workshops#destroy',as:'workshops_delete'
    get '/workshops/:planner_id/:workshop_id'=> 'workshops#show',as:'workshops_show' 
  
    get 'posts/:workshop_id/:post_id/index'=>'posts#index',as:'posts_index'
    get '/posts/:workshop_id'=>'posts#show',as:'posts_show'

    get 'reservations/:workshop_id/index'=>'booking#index',as:'booking_index'
  end
      
 
 

  namespace :users do
      #参加者ログイン
      get '/login_form' => 'user_sessions#new',as:'login'
      post '/login' => 'user_sessions#create',as:'login_create'
      delete '/logout' => 'user_sessions#destroy',as:'logout'
       #参加者会員登録
      get '/index' => 'users#index',as:'index'
      get '/new'=>'users#new',as:'signup'
      post '/create'=>'users#create',as:'create'
      get '/:user_id/edit' => 'users#edit',as:'edit'
      patch '/:user_id/edit'=>'users#update',as:'update'
      get '/:user_id'=>'users#show',as:'show'

      
    #レビュー
    get '/:user_id/posts/:workshop_id/posts'=>'posts#index',as:'posts_index'
    get '/:user_id/posts/:workshop_id/new' => 'posts#new', as: 'posts_new'
    post '/:user_id/workshops/:workshop_id/post' => 'posts#create', as: 'workshop_post'
    get 'posts/:post_id/edit' => 'posts#edit',as:'posts_edit'
    patch 'posts/:post_id/edit'=> 'posts#update',as:'posts_update'
    get '/:user_id/:workshop_id/posts/:post_id'=>'posts#show',as:'posts_show'

    #user_workshop
    get'/workshops/index'=>'workshops#index',as:'workshops_index'
    get '/:workshop_id/new'=>'workshops#new',as:'workshops_new'
    get '/workshops/:u_workshop_d/edit'=>'workshops#edit',as:'workshops_edit'
    patch '/workshops/:u_workshop_id/edit' => 'workshops#update',as:'workshops_update'
    get '/:user_id/workshops/:workshop_id'=>'workshops#show',as:'workshops_show' 

    get'/:user_id/workshop/:workshop_id/reservations/new'=>'reservations#new',as:'reservations_new'
    get '/:user_id/reservations'=>'reservations#index',as:'reservations_index'
    post '/users/:user_id/workshops/:workshop_id/reservations' => 'reservations#create', as: 'reservations_create'
    get '/reservations/:user_id/:reservation_id/edit'=>'reservations#edit',as:'reservations_edit'
    patch'/reservations/:user_id/:reservation_id/edit' => 'reservations#update',as:'reservations_update'
    delete '/reservations/:reservation_id' => 'reservations#destroy', as: 'reservations_destroy'
    get '/:user_id/reservations/:reservation_id'=>'reservations#show',as:'reservations_show'
  end
 
  get 'images/index'=>'images#index'
  get 'images/new'=>'images#new'
  post'images/create'=>'images#create', as: 'create_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end

