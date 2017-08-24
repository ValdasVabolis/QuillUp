class Users::RegistrationsController < Devise::RegistrationsController
  layout -> {
    if user_signed_in?
      'account'
    else
      'application'
    end
  }

  def edit
    super
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation,
      :about
    )
  end

  def account_update_params
    params.require(:user).permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation,
      :current_password,
      :about
    )
  end
end