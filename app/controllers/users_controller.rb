class UsersController < ApplicationController
  def new
    render 'new'
  end

  def show
    @user = User.find(params[:id])
    render 'show'
  end

  def create
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], location: params[:location], state: params[:state])
    if @user.errors.full_messages.empty?
      @events = Event.all
      session[:user_id] = @user.id
      render '/events/index'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  def update
    @user = User.find(params[:id])
    @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: @user.password_digest, location: params[:location], state: params[:state])
    redirect_to "/events/index"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:message] = 'please come back soon'
    render 'new'
  end
end
