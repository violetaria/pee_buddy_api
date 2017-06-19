class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Rating.new(create_params)
    if @rating.save
      render json: @rating, status: :created
    else
      render json: { errors: @rating.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(update_params)
    render json: @rating, status: :ok
  end

  private

  def create_params
    params.require(:rating).permit(:location_id, :rating, :rating_type)
  end

  def update_params
    params.require(:rating).permit(:rating)
  end
end
