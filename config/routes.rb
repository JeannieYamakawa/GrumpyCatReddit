Rails.application.routes.draw do
    # get 'welcome' => 'pages#home'
    get "/messages" => "messages#index"
    get "/messages/new" => "messages#new"
    post 'messages' => 'messages#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 
