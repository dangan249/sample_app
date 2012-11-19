class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!" 
      # flash.now here is wrong since we need the flash to stay on after a redirect
      redirect_to @user
    else
      flash.now[:error] = "Failed to Sign Up. Please try again !  " 
      # flash.now here so it disapper when user navigate to a different page
      render 'new'
    end
  end
end
