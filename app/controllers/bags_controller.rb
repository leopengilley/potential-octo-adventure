class BagsController < ApplicationController
  before_action :check_for_login

  def index
    @bags = @current_user.bags.all
  end

  def new
    @bag = Bag.new
    @pokemons = Pokemon.all
  end

  def create
    bag = Bag.create bag_params
    @current_user.bags << bag ########user now has a bag associated with their acocunt
    redirect_to root_path
  end

  def edit
    @bag = Bag.find params[:id]
  end

  def update
    bag = Bag.find params[:id]
    bag.update bag_params
    redirect_to bag
  end

  def show
    @bag = Bag.find params[:id]
  end

  def destroy
    bag = Bag.find params[:id]
    bag.destroy
    redirect_to bags_path
  end

  private
  def bag_params
    params.require(:bag).permit(:title, :pokemon_ids => [])
  end
end
