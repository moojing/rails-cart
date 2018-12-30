# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :check_if_user , only: [:new]
  
  # GET /resource/sign_in
  def new
    super
    
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def check_if_user
    if current_user
      puts 'yeah~redirect'
      redirect_to :root and return
    end
  end

  def after_sign_in_path_for(resource)
    # stored_location_for(resource) || root_path
    signed_in_root_path(resource)
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
end
