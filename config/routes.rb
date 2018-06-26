Rails.application.routes.draw do
  get '/users/signup'
  get '/users/register'
  
  get '/users/login'
  get '/users/logining'
  
  get '/users/logout'

  get '/users/getout'

 get '/' => 'posts#index'
 get '/posts/new' => 'posts#new'
 get '/posts/create' => 'posts#create'
 get '/posts/show/:id' => 'posts#show'
 get '/posts/edit/:id' =>'posts#edit'
 get '/posts/update/:id' => 'posts#update'
end
