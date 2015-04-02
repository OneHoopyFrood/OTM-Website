class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  # GET /users/1/profile/
  def show
  end

  # GET /users/1/profile/edit
  def edit
  end

  # PATCH/PUT /users/1/profile
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        flash[:success] = "Profile was successfully updated."
        redirect_to @profile
      else
        render :edit
      end
    end
  end

  private
    def set_profile
      @profile = Profile.find_by(user_id: params[:user_id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :bio, :service_start, :service_end, :facebook, :twitter, :g_plus, :areas)
    end
end
