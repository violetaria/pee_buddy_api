class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_rating, only: :update

  def create
    @rating = current_user.ratings.new(create_params)
    if @rating.save
      render json: @location, status: :created
    else
      render json: { errors: @rating.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    if @rating.update(update_params)
      render json: @location, status: :ok
    else
      render json: { errors: @rating.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def find_rating
    @rating = Rating.find(params[:id])
  end

  def create_params
    rating_params = params.require(:rating).permit(:location_id, :rating, :rating_type)
    rating_params[:rating_type] = :cleanliness
    rating_params
  end

  def update_params
    params.require(:rating).permit(:rating)
  end
end
