Rails.application.routes.draw do
  #top
  root 'home#top'

  get 'home/about'=>'home#about'

  get 'posts#index'=>'posts#index'
  get 'posts/show' => 'posts#show'
  get 'posts/new' => 'posts#new'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
