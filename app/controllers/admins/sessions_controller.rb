# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 
  
  # GET /resource/sign_in
  # def new
  #   super
    
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def check_if_user
    if current_user
      redirect_to :root and return
    end
  end

  def after_sign_in_path_for(resource)
    # signed_in_root_path(resource) || root_path
    '/admins/products'
  end

  def after_sign_out_path_for(resource)
    '/admins/sign_in' || root_path
  end
  
end
