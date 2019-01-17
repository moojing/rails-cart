class CouponsController < ApplicationController
  def check
    coupon = Coupon.find_by(:code=>params[:code])
    if coupon.present?
      render json: {success:'true',discount:coupon.discount} 
    else  
      render json: {success:'false'}
    end
  end
end
