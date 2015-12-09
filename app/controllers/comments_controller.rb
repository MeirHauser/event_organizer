class CommentsController < ApplicationController
  def create
  	comment = Comment.create(comment: params[:comment], event: Event.find(params[:event_id]), user: User.find(session[:user_id]))
  	redirect_to "/events/#{params[:event_id]}"
  end
end
