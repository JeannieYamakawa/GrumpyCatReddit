class MessagesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@messages = Message.all
	end

	def show
        @message = Message.find(params[:id])
	end

	def new
		@message = current_user.messages.build
	end

	def edit
		@user = User.find(params[:user_id])
        @message = Message.find(params[:id])
	end


	def update
		@message = Message.find(params[:id])
		p current_user, "*currentUser" *10
		p message_params
		if @message.update_attributes(message_params)
			redirect_to '/messages'
		else
			# p "?" *80
			render 'edit'
		end
	end


    def create
        @message = current_user.messages.build(message_params)
			p "*" *80
			p message_params
	        if @message.save
	            redirect_to messages_path
	        else
	            render 'new'
	        end
    end

	def destroy
		if Message.find(params[:id]).user_id === current_user.id
		@message = Message.find(params[:id]).destroy
		flash[:success] = "Post deleted"
    	redirect_to '/messages'
		else
			flash[:alert] = "You cannot delete another user's post"
			redirect_to '/messages'
		end
	else
	end

	private
  	def message_params
      	params.require(:message).permit([:content, :website])
  	end
end
