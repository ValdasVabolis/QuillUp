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

  private

  def sign_up_params
    params.require(:user).permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation
    )
  end
end