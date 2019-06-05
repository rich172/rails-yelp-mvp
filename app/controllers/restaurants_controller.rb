class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end

class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
