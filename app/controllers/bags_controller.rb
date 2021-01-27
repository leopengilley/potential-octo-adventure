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
    bag.pokemon_ids << params[:pokemon_ids]
    bag = Bag.create bag_params
    @current_user.bags << bag
    redirect_to root_path
  end

  def show
    @bag = Bag.find params[:id]
  end

  private
  def bag_params
    params.require(:bag).permit(:title, :pokemon_ids)
  end
end
