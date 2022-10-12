Rails.application.routes.draw do


  #top
  root 'home#top'

  get 'home/select_position'=>'home#select_position'
  get 'home/select_position_E'=>'home#select_position_E'
  get 'home/select_position_K'=>'home#select_position_K'
  get 'home/about'=>'home#about'

  get 'posts/index'=>'posts#index'
  get 'posts/show' => 'posts#show'
  get 'posts/new' => 'posts#new'

  #login
  get 'sessions/new'=>'sessions#new',as: 'login'
  post 'sessions/create'=>'sessions#create',as: 'sessions'
  delete 'logout' =>'sessions#destroy'

  #signup
  get 'users/new' => 'users#new', as: 'signup'
  get 'users/show'=>'users#show'
  post 'users/create'=>'users#create', as: 'users'
  #plannerssignup
  get 'planners/new'=> 'planners#new',as:'planners_login'
  post 'planners/create'=>'planners#create' ,as:'planners_new'
  #album
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
