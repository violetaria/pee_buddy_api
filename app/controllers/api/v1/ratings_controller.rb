class Api::V1::RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update]
  before_action :set_location

  def create
    create_rating_params = rating_params.merge(user: current_user)
    @rating = @location.ratings.new(create_rating_params)
    if @rating.save
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @rating.errors.messages }, status: :unprocessable_entity
    end
  end

  def show
    render 'show.json.jbuilder', status: :ok
  end

  def update
    @rating.update(params.permit(:rating))
    render 'update.json.jbuilder', status: :ok
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def rating_params
    params.require(:rating).permit(:location_id,:rating, :category)
  end
end
