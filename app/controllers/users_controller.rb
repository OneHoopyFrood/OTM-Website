class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to OklahomaTulsaMission.com #{@user[:fname]}!"
			redirect_to edit_user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
		end
end
