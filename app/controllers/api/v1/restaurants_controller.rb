class Api::V1::RestaurantsController < Api::V1::BaseController
  before_action :set_restaurant, only: [ :show, :update ]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant  # For Pundit
  end

  def updade
    @restaurant.updade(restaurant_params)
  end


  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant  # For Pundit
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :add )

  end
end
