class PokemonsController < ApplicationController

  def index
    @api_list = PokeApi.get(pokemon: {limit: 1200, offset: 0})
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    pokemon = Pokemon.new(pokemon_params)
    if params[:front, :back].present?
      req = Cloudinary::Uploader.upload(params[:front, :back])
      pokemon.image = req["public_id"]
      pokemon.save
    end
    redirect_to pokemons_index_path
    else
      render :new
    end
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
