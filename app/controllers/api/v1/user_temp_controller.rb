class Api::V1::UserTempController <ApplicationController
    skip_before_action :verify_authenticity_token
def create
    #parametro = Setting.select(:token,:urlEndPoint).all
    
    #render json: parametro
    if params[:token] == "123456789"
        render json: {
            :Data => {
                :FirstName => "Juan Carlos",
                :LastName =>  "Santiago",
                :NickName =>  "Juan Carlos Santiago",
                :Email => "krlos013@hotmail.com"
            }
        }
        
    else
        render json: { "mensaje" => "Usuario no valido"}
    end
end
end