class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to OklahomaTulsaMission.com #{@user[:fname]}!"
			redirect_to edit_user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		if logged_in?
			@user = User.find(current_user.id)
		else
			render :status => :forbidden, :text => "You must login to access that page"
		end
	end

	def myaccount
		if logged_in?
			@user = current_user
			render 'edit'
		else
			render :status => :forbidden, :text => "You must login to access that page"
		end
	end

	private
		def user_params
			params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
		end
end
