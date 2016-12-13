class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end

	def show
        @message = Message.find(params[:id])
	end

	def new
		@message = Message.new
	end

	def edit
		@user = User.find(params[:id])
        @message = Message.find(params[:id])
	end


	def update
		@message = Message.find(params[:id])
		if @message.update_attributes(message_params)
			redirect_to '/messages'
		else
			render 'edit'
		end
	end


    def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to '/messages'
        else
            render 'new'
        end
    end

	def destroy
		puts @message = Message.find(params[:id])

	end

	private
  	def message_params
    	params.require(:message).permit([:user_id, :content, :website])
  	end
end
