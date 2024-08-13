class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def read
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @Event = Event.new(title: "...", body: "...")

    if @Event.save
      redirect_to @Event
    else
      render :new, status: :unprocessable_entity
    end


end
