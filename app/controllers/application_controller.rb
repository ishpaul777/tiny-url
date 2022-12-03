class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    urls_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def after_sign_up_path_for(_resource)
    urls_path
  end

  # find the current user or guest user
  def current_user
    super || guest_user
  end

  # check if the user is a guest user
  def guest_user
    User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
  end

  # create guest user
  def create_guest_user
    # create a token for guest user
    token = SecureRandom.base64(15)
    user = User.new(name: 'anonymous', password: token,
                    email: "#{token}@example.com")
    user.role = 'guest'
    user.save(validate: false)
    user
  end

  # sign in guest user
  def sign_in_guest_user
    sign_in(guest_user)
    redirect_to urls_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
