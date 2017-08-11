class Users::RegistrationsController < Devise::RegistrationsController
  layout 'account'

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