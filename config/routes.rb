Rails.application.routes.draw do
    root 'messages#index'
    devise_for :users

    resources :messages
    resources :users do
        resources :messages do
            resources :comments
        end
    end
    get '/users/:user_id/usermessages', to: 'messages#byUser', as: 'single_user_messages'

end
