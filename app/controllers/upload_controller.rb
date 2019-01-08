class UploadController < ApplicationController

   def create 
     
        mydata = {:image => params[:upload]}
        @upload = Image.create!(mydata)
        
        if @upload.valid?
            @upload.save
            render json: {"message":"200",imageUrl:@upload.image[:original].id,image_id: @upload.id}
        end 
          
   end 
    private

    def upload_params
        
        params.require(:upload).permit!
        
    end
end
