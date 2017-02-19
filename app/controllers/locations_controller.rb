class LocationsController < ApplicationController

  def index
    @locations = Location.includes(:ratings).within(5, :origin => [params[:lat],params[:lng]])
    render :index, status: :ok
  end

  def show

  end
end
