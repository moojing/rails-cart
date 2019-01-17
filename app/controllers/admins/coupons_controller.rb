class Admins::CouponsController < Admins::ApplicationController
  
  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new 
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.valid?
      @coupon.save
      flash[:success] = "Coupon has been created!!"
      redirect_to admins_coupons_path 
    else  
      flash[:error] = @coupon.errors 
      redirect_back(fallback_location: admin_root_path)
    end
  end

  def update
    @coupon  = Coupon.find(params[:id])
    @coupon.update(coupon_params)
    if @coupon.save
      flash[:success] = "Product has been  updated!!"
      redirect_to admins_coupons_path 
    else  
      flash[:error] = @coupon.errors 
      redirect_back(fallback_location: admin_root_path)
    end
  end

  def edit
    
   @coupon  = Coupon.find(params[:id])
  end

  def show
  end



  def destroy
    Coupon.destroy(params[:id])
    flash[:alert] = "Coupon has been  deleted!!"
    redirect_to admins_coupons_path 
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code,:expire_at,:discount,:remain)
  end

  def redirect_to_default
    redirect_to admin_root_path
  end
end
