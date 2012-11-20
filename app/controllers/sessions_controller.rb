class SessionsController < ApplicationController

  def new
  	render 'new'
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user # save the cookie to user's browser and set @current_user
      redirect_to user # go to user's page
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end