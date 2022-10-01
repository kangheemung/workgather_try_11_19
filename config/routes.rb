Rails.application.routes.draw do
  get 'users/new'
  #top
  root 'home#top'
  get 'home/select_position'=>'home#select_position'
  get 'home/select_position_E'=>'home#select_position_E'
  get 'home/select_position_K'=>'home#select_position_K'
  get 'home/about'=>'home#about'

  get 'posts#index'=>'posts#index'
  get 'posts/show' => 'posts#show'
  get 'posts/new' => 'posts#new'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
