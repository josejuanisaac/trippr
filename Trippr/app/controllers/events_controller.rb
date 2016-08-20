class EventsController < ApplicationController
  def index
    @user = current_user
    if @user
      @created_events = @user.created_events
      @guested_events = @user.guested_events
    else
      redirect_to '/'
    end
  end

  def new
    @event = Event.new(creator_id: current_user.id)
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      puts "successful"
      render json: @event
    else
      puts "fail"
      render json: @record.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  def add_guests
    @event = Event.find(params[:event_id])
    @event.add_guests(params[:guests])
    redirect_to event_path(@event)
  end

  def delete_guests
    @event = Event.find(params[:event_id])
    @event.delete_guests(params[:guests])
    redirect_to event_path(@event)
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :creator_id)
  end
end
