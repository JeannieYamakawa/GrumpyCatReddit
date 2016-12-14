Rails.application.routes.draw do
    root 'messages#index'
    devise_for :users

    resources :messages
    resources :users do
        resources :messages do
            resources :comments
        end
    end

end
