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
                p "*" *30
            if @user.save
                redirect_to messages_path
            else
                # render 'new'
                puts 'This isnt working'
                p "*" *80
            end
    end


    def show
        p "*" *80
        puts @user.username

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



    	def destroy
            p "*" *80
            puts User.find(params[:id]).id
            puts User.find(params[:id]).username
            puts current_user.id
    		if User.find(params[:id]).id === current_user.id
    		@user = User.find(params[:id]).destroy
    		flash[:success] = "User successfully deleted"
        	redirect_to '/messages'
    		else
    			flash[:alert] = "You cannot delete another user's account"
    			redirect_to users_path
    		end
    	else
    	end

    private
    def user_params
        params.require(:user).permit(:username)

    end





end
