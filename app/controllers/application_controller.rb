class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception

	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :tel, :email, :password, :password_confirmation, :name])
	end

end
