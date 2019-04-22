class Api::V1::CreateAdminController <ApplicationController
    skip_before_action :verify_authenticity_token
    def create

        email = params[:email]
        password = params[:password]

        
        eventos = Admin.create({
                :email => params[:email],
                :password => params[:password]
            })
        render json: {"mensaje": "Creado satisfactoriamente"}
       
        
     end
end