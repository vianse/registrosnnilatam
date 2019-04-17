class HomeController < ApplicationController
  def index
    
    require 'json'
    require 'uri'
    require 'net/http'
    require 'rest_client'
    if params[:token].blank? 
      @url = Setting.all.pluck(:urlReditectionTokenEmpty).first
      redirect_to @url
    else
      @endPoint = Setting.all.pluck(:urlEndPoint).first
      @parametro = Setting.all.pluck(:token).first
      @urlRedirectionTokenError = Setting.all.pluck(:urlRedirectionTokenError).first
     begin
     
        uri = URI(@endPoint)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
        request = Net::HTTP::Get.new(uri, {'Content-Type' =>'application/json'})
        request.body = {@parametro => params[:token]}.to_json
        res = http.request(request)
        result = JSON.parse(res.body)
        puts "response #{res.body}"
        if res.nil?

         #puts "response #{res.body}"
         #puts JSON.parse(res.body)
         redirect_to @urlRedirectionTokenError
         
         
        else
          @firstName = result['Data']['FirstName']
         @lastName = result['Data']['LastName']
         @nickName = result['Data']['NickName']
         @email = result['Data']['Email']
         @events = Event.order(:id).page params[:page]
         @events_registred = EventRegister.where(:email =>  @email).pluck(:id)
        end
  
        if (@events_registred.blank?) 
          @registrado = 0
  
        else
          @registrado = 1
        end
     rescue => e
        puts "failed #{e}"
     end
   end
  end
  

end
