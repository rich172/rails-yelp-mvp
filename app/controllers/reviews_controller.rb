class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    # we need @restaurant in our `simple_form_for`
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    # @review.restaurant = Restaurant.find(params[:restaurant_id])
    # @review.save
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
