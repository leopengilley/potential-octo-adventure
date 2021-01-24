class BagsController < ApplicationController
  before_action :check_for_login

  def new
    @bag = Bag.new
  end

  def create
    bag = Bag.create bag_params
    @current_user.bags << bag
    redirect_to root_path
  end

  private
  def bag_params
    params.require(:bag).permit(:title)
  end
end
