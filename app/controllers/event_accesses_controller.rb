class EventAccessesController < ApplicationController
  before_action :get_event, only: [:index, :new, :create]
  before_action :set_event_access, only: [:show, :edit, :update, :destroy]

  def index
    @event_accesses = @event.event_accesses
  end

  def new
    @event_access_form = EventAccessForm.new
  end

  def create
    @event_access_form = EventAccessForm.new(params[:event_access_form])
    if @event_access_form.valid?
      @event_access_form.event_access.save!
      redirect_to event_event_accesses_path, notice: 'Event access was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @event_access.destroy
    redirect_to event_accesses_url
  end

  private

    def get_event
      @event = Event.find(params[:event_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event_access
      @event_access = EventAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_access_params
      params.require(:event_access).permit(:type, :user_id, :event_id)
    end
end
