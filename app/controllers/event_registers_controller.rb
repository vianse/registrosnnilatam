class EventRegistersController < ApplicationController
  before_action :set_event_register, only: [:show, :edit, :update, :destroy]

  # GET /event_registers
  # GET /event_registers.json
  def index
    @event_registers = EventRegister.all
  end

  # GET /event_registers/1
  # GET /event_registers/1.json
  def show
  end

  # GET /event_registers/new
  def new
    @event_register = EventRegister.new
  end

  # GET /event_registers/1/edit
  def edit
  end

  # POST /event_registers
  # POST /event_registers.json
  def create
    @event_register = EventRegister.new(event_register_params)

    respond_to do |format|
      if @event_register.save
        format.html { redirect_to @event_register, notice: 'Event register was successfully created.' }
        format.json { render :show, status: :created, location: @event_register }
      else
        format.html { render :new }
        format.json { render json: @event_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_registers/1
  # PATCH/PUT /event_registers/1.json
  def update
    respond_to do |format|
      if @event_register.update(event_register_params)
        format.html { redirect_to @event_register, notice: 'Event register was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_register }
      else
        format.html { render :edit }
        format.json { render json: @event_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_registers/1
  # DELETE /event_registers/1.json
  def destroy
    @event_register.destroy
    respond_to do |format|
      format.html { redirect_to event_registers_url, notice: 'Event register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_register
      @event_register = EventRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_register_params
      params.require(:event_register).permit(:firtsName, :lastName, :nickName, :email, :eventId)
    end
end
