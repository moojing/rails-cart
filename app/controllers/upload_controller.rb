class UploadController < ApplicationController
   def show 
    
    images = Product.find(params[:id]).image
    image_arr = []
    
    images.each do |image|
        image_arr << {:imageUrl => image.image[:original].id , :id=>image.id}
    end
    render json: {"message":"200",images:image_arr } 
            
   end
   def create 
     
        mydata = {:image => params[:upload]}
        @upload = Image.create!(mydata)
        
        if @upload.valid?
            @upload.save
            render json: {"message":"200",imageUrl:@upload.image[:original].id,image_id: @upload.id}
        end 
          
   end 
   def delete 
        Image.destroy(params[:image_id])
        render json: {"message":"200",image_id:params[:image_id]}
   end 


    private

    def upload_params
        
        params.require(:upload).permit!
        
    end
end
