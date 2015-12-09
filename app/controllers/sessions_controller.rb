class SessionsController < ApplicationController
  def create
  	@user = User.find_by_email(params[:email])
  	if @user
	  	if @user.authenticate(params[:password])
			@events = Event.all
	  		session[:user_id] = @user.id
	  		render "/events/index"
	  	else
	  		flash[:error] = 'Invalid password'
	  		redirect_to "/users/new"
	  	end
	else
		flash[:error] = 'User does not exist'
		redirect_to "/users/new"
	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:message] = 'Come back soon'
  	redirect_to '/users/new'
  end
end
