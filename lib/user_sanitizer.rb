class Runner::ParameterSanitizer < Devise::ParameterSanitizer
  private

  def account_update
  	default_params.permit(:name, :bio, :age, :country, :avatar, :email, :password, :password_confirmation)
  end

end