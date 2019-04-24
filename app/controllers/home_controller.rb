class HomeController < ApplicationController
  def index
    
    
    require 'uri'
    require 'net/http'
    require 'rest_client'
    require 'json'
    if params[:token].blank? 
      @url = Setting.all.pluck(:urlReditectionTokenEmpty).first
      redirect_to @url
    else
      @endPoint = Setting.all.pluck(:urlEndPoint).first
      @parametro = Setting.all.pluck(:token).first
      @ApiKey = Setting.all.pluck(:apiKey).first
      @urlRedirectionTokenError = Setting.all.pluck(:urlRedirectionTokenError).first
     begin

     res =  RestClient.post "#{@endPoint}", {"ApiKey" => @ApiKey.to_s, "#{@parametro}" => params[:token], "Domain" => "registro.nnilatam.com"}.to_json, {content_type: :json, accept: :json}
        hash = JSON.parse res
        re = hash['Data']
        firstName = JSON(re)['FirstName']
        lastName = JSON(re)['LastName']
        nickName = JSON(re)['Nickname']
        email = JSON(re)['Email']
        country = JSON(re)['Country']
    
      
          @firstName = firstName
          @lastName = lastName
          @nickName = nickName
          @email    = email
          @country  = country
         # @events = Event.where(:active => 1).order(:position).page params[:page]
          @events = Event.order(:position).page params[:page]
          @events_registred = EventRegister.where(:email =>  @email).pluck(:id)
        
  
        if (@events_registred.blank?) 
          @registrado = 0
  
        else
          @registrado = 1
        end
     rescue => e
        redirect_to  @urlRedirectionTokenError
        #puts "failed #{e}"
     end
   end
  end
  
  
end
