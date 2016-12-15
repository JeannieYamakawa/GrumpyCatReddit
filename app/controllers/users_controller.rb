class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = current_user.build
    end

    def create
        @user = current_user.build(user_params)
            p "*" *80
            p user_params
            if @user.save
                redirect_to messages_path
            else
                # render 'new'
                puts 'This isnt working'
                p "*" *80
            end
    end


    def show
        @user = User.find(params[:id])
        @messages = @user.messages
    end


    def edit
        @user = User.find(params[:id])

    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to(:action => 'show', :id => @user.id)
        else
            render 'edit'
        end
    end


    private
    def user_params
        params.require(:user).permit(:username)
    end





end
