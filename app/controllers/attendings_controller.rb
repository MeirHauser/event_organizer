class AttendingsController < ApplicationController
  def create
  	@attending = Attending.create(user: User.find(session[:user_id]), event: Event.find(params[:event_id]))
  	redirect_to '/events/index'
  end

  def destroy
  	attending = Attending.find(params[:id])
  	attending.destroy
  	redirect_to '/events/index'
  end
end
