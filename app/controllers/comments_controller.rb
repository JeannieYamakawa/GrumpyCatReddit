class CommentsController < ApplicationController
    	before_action :authenticate_user!, except: [:index, :show]
    	def index
    		@comments = Comment.where(message_id: params[:message_id])
            @messageToView = Message.find(params[:message_id])
            @userWhoPosted = User.find(@messageToView.user_id)
    	end

    	def show
            @comment = Comment.find(params[:id])
    	end

    	def new
            @message = Message.find(params[:message_id])
            p @message
            @comment = Comment.new
            p @comment
            p "*" *10
    	end

    	def edit
    		@user = User.find(params[:user_id])
    		if Comment.find(params[:id]).user_id === current_user.id
    			@comment = Comment.find(params[:id])
    		else
    			flash[:alert] = "You cannot delete another user's comment"
    			redirect_to user_message_comments_path
    		end
    	end


    	def update
    		@comment = Comment.find(params[:id])
    		p current_user, "*currentUser" *10
    		p comment_params
    		if @comment.update_attributes(comment_params)
    			redirect_to user_message_comments_path
    		else
    			# p "?" *80
    			render 'edit'
    		end
    	end


        def create
            @comment = Comment.new(comment_params)
            @comment.user_id = current_user.id
            @comment.message_id = params[:message_id]
            p "*" *80

            p comment_params

    			p @comment
    	        if @comment.save
    	            redirect_to user_message_comments_path
    	        else
    	            render 'new'
    	        end
        end

    	def destroy
    		if Comment.find(params[:id]).user_id === current_user.id
    		@comment = Comment.find(params[:id]).destroy
    		flash[:success] = "Comment deleted"
        	redirect_to user_message_comments_path
    		else
    			flash[:alert] = "You cannot delete another user's comment"
    			redirect_to '/messages'
    		end
    	else
    	end

    	private
      	def comment_params
          	params.require(:comment).permit([:content])
      	end
    end
