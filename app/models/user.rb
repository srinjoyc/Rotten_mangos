class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

    def full_name
        "#{firstname} #{lastname}"
    end

    def new
        @user = User.new
      end

      def create
        @user = User.new(user_params)

        if @user.save
          redirect_to movies_path
        else
          render :new
        end
      end

      protected

      def user_params
        params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
      end

end