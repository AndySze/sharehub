class SessionsController < ApplicationController
  def new
  end

  def create
    authorized_user = User.authenticate(params[:name],params[:password])

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:user_name] = authorized_user.name
      flash[:notice] = "You are logged in!"
      redirect_to authorized_user
      puts "success! #{authorized_user.id} #{authorized_user.name}"
    else
      flash[:error] = "Invalid username/password!"
      redirect_to signin_path
      puts "falure!"
    end

  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    flash[:notice] = "You have been logged out."
    redirect_to signin_path
  end

end
