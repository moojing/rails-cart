class ContactsController < ApplicationController
    
    def create 
        @contact = Contact.new(contact_params)
        if @contact.save 
            render json: {status: 200,message: 'Your message has been successfully sent.'}
        end
        
    end 


    private
	def contact_params
		params.require(:contact).permit(:name, :mail,:phone, :note)
	end

end
