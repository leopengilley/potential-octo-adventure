class PokemonsController < ApplicationController

  def index
    @api_list = PokeApi.get(pokemon: {limit: 1200, offset: 0})
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    pokemon = Pokemon.create pokemon_params
    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  def show
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
