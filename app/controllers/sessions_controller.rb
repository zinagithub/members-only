class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		log_in user
  		remember user
  		redirect_to user
  	else
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
    redirect_to login_path
  end

end
