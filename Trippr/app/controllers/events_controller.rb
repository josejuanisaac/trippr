class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
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
    p params[:guests]
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
