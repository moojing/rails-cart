class ContactsController < ApplicationController
    
    def create 
        @contact = Contact.new(contact_params)
        if @contact.save 
            flash[:success] = "The message has sent, thank you!!"
        end
        redirect_to root_path :anchor => 'footercontact'
        # render json: {status: 200}
    end 


    private
	def contact_params
		params.require(:contact).permit(:name, :mail,:phone, :note)
	end

end
