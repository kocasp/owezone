class EventAccessesController < ApplicationController
  before_action :set_event_access, only: [:show, :edit, :update, :destroy]

  # GET /event_accesses
  # GET /event_accesses.json
  def index
    @event_accesses = EventAccess.all
  end

  # GET /event_accesses/1
  # GET /event_accesses/1.json
  def show
  end

  # GET /event_accesses/new
  def new
    @event_access = EventAccess.new
  end

  # GET /event_accesses/1/edit
  def edit
  end

  # POST /event_accesses
  # POST /event_accesses.json
  def create
    @event_access = EventAccess.new(event_access_params)

    respond_to do |format|
      if @event_access.save
        format.html { redirect_to @event_access, notice: 'Event access was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_access }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_accesses/1
  # PATCH/PUT /event_accesses/1.json
  def update
    respond_to do |format|
      if @event_access.update(event_access_params)
        format.html { redirect_to @event_access, notice: 'Event access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_accesses/1
  # DELETE /event_accesses/1.json
  def destroy
    @event_access.destroy
    respond_to do |format|
      format.html { redirect_to event_accesses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_access
      @event_access = EventAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_access_params
      params.require(:event_access).permit(:type, :user_id, :event_id)
    end
end
