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

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    pokemon = Pokemon.new(pokemon_params)
    if params[:front, :back].present?
      req = Cloudinary::Uploader.upload(params[:front, :back])
      pokemon.image = req["public_id"]
    end
    pokemon.update_attributes(pokemon_params)
    pokemon.save
    redirect_to(pokemons_index_path)
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :attack, :front, :back)
  end
end
