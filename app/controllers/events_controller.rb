class EventsController < ApplicationController
  def index
  	@events = Event.all
	@user = User.find(session[:user_id])
	render 'index'
  end

  def show
  	@event = Event.find(params[:id])
  	@attendings = Attending.where("event_id = ?", params[:id])
  	@comments = Comment.where("event_id = ?", params[:id])
  	render 'show'
  end

  def create
  	@event = Event.create(name: params[:name], date: params[:date], user: User.find(session[:user_id]))
  	if @event.errors.full_messages
  		flash[:errors] = @event.errors.full_messages
  	end
	redirect_to '/events/index'
  end

  def destroy
  	event = Event.find(params[:id])
  	event.destroy
  	redirect_to '/events/index'
  end
end
