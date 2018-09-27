
class  SessionsController < Devise::SessionsController
  
prepend_before_action :require_no_authentication, :only => [:create ]

skip_before_action    :verify_authenticity_token
before_action         :sign_out_logged_in_user

include Devise::Controllers::Helpers



# GET /resource/sign_in
# def new
  # super
# end

def
  sign_out_logged_in_user
  puts"sign_out_logged_in_user"
end



# POST /resource/sign_in

def create
  #super

  user = User.all.first
  begin
    sign_in(:user, user)
    puts "after sign_in"
  rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect
  end

  puts user_signed_in?
  puts current_user.inspect
  redirect_to users_url

end



# DELETE /resource/sign_out
def destroy
  super
end

# protected

# If you have extra params to permit, append them to the sanitizer.

# def configure_sign_in_params

# devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])

# end


end