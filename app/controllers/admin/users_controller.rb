class Admin::UsersController < ApplicationController 
    layout 'admin'

      def new
        @user = User.new
      end

    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to admin_root_path
        else
          render :new
        end
    end

    def index 
        @users= User.all 
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_root_path
    end  

protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

  def is_admin?
    if (@current_user.is_admin == true)
    end 
  end 

  def current_user
     if session[:user_id]
        @current_user ||= User.find(session[:user_id])
    else 
        nil
    end 

  end

  helper_method :current_user

  helper_method :is_admin?

end
