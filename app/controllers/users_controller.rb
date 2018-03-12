class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:my_account, :edit, :edit_password, :update, :update_password]
  before_action :authenticate_user!

  def index
  end

  def my_account
  end

  def edit
  end

  def edit_password
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_my_account_path, notice: 'La información de tu cuenta se actualizo con éxito.' }
        format.json { render :show, status: :ok, location: @privacy_policy }
      else
        format.html { render :edit }
        # format.json { render json: @privacy_policy.errors, status: :unprocessable_entity }
      end
    end
  end


  def update_password
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to users_my_account_path, notice: '¡Tu contraseña se actualizo con exito!'
    else
      render "edit_password"
    end
  end


  private 
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :image, :password, :password_confirmation)
    end
end
