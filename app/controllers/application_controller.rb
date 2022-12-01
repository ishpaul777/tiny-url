# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    urls_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    urls_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
