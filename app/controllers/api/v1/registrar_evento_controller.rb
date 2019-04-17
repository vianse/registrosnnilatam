class Api::V1::RegistrarEventoController <ApplicationController
    skip_before_action :verify_authenticity_token  
    def create

        firstName = params[:firstName]
        lastName = params[:lastName]
        nickName = params[:nickName]
        email = params[:email]
        eventId = params[:eventId]

        if (params[:email].blank?)
            render json: {:message => "Se encontro un erro en algun parametro, favor de revisar la petición"}
        else
            registrar = EventRegister.create({
                :firtsName => firstName,
                :lastName => lastName,
                :nickName => nickName,
                :email => email,
                :eventId => eventId
             })

              render json: {:message => "Registro creado satisfactoriamente"}
              
        end
     end
end