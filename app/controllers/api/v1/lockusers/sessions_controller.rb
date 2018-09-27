# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  
  skip_before_filter   :verify_authenticity_token
  protect_from_forgery with: :null_session
  request.session_options[:skip] = true

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     ##super
     puts "testing"
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
