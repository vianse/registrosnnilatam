class Api::V1::GetEventosController <ApplicationController
    def index

  
        posicion = params[:posicion]
        active = 1

        if (params[:posicion].blank?)
            eventos = Event.where(:active => active)
              render json: eventos
        else
            eventos = Event.where(:active => active).order(id: :asc, position: :asc)
              render json: eventos
           
        end
     end
end