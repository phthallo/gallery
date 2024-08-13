class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    #  @event.images.purge
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

  def edit
    @event = Event.find(params[:id])
    @event.images.attach(params[:images])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def event_params
      params.require(:event).permit(:title, :body, images: [])
    end
end
