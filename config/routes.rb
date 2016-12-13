Rails.application.routes.draw do
    # get 'welcome' => 'pages#home'
    resources :users do
        resources :messages do
            resources :comments
        end
    end
    # get "messages" => 'messages#index'
    # get "messages/:id" => 'messages#edit'
    # get "messages/:id/delete" => 'messages#destroy'
    resources :messages
end
