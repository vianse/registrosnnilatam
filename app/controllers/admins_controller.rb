class AdminsController < ApplicationController
   
   
    
    
    
   
      before_action :authenticate_admin!
 
      before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this
    # GET /users
    # GET /users.json
    def index
      if admin_signed_in? 
      @users =Admin.all
      else
        redirect_to "/admins/sign_in"
      end
    end
  
    # # GET /users/1
    # # GET /users/1.json
    def show
      if admin_signed_in? 
      
        else
          redirect_to "/admins/sign_in"
        end
    end


  # GET /events/new
  def new
    if admin_signed_in? 
      @user =Admin.new
      else
        redirect_to "/admins/sign_in"
      end
    
  end
    # GET /users/1/edit
    def edit
      if admin_signed_in? 
       
        else
          redirect_to "/admins/sign_in"
        end
    end
  
    # # PATCH/PUT /users/1
    # # PATCH/PUT /users/1.json
    def update
      if admin_signed_in? 
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
        else
          redirect_to "/admins/sign_in"
        end
     
    end

 
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = Admin.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:admin).permit(:email, :password)
      end
  
end
