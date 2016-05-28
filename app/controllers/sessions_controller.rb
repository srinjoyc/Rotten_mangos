class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.is_admin == true 
        redirect_to admin_root_path
      else 
      redirect_to movies_path
      end 
    else
      render :new
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to movies_path, notice: "Adios!"
  end

end
