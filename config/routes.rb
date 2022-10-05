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
  get 'users/participate_new' => 'users#participate_new', as: 'signup'
  get 'users/workshop_Organizer_new'=>'users#workshop_Organizer_new'
  post 'users/create'=>'users#create',as: 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
