class ApplicationController < ActionController::Base
     
    layout :layout_by_resource
    helper_method :categories,:new_products

    def categories 
      Category.all
    end


    private
    
   
    def layout_by_resource
      if devise_controller? && resource_name == :admin
        is_a?(Devise::SessionsController)||is_a?(Devise::RegistrationsController)  ? "admin/guest" : "dashboard"
      else
        "application"
      end
    end
end
