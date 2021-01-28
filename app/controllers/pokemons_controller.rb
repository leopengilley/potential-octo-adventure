class PokemonsController < ApplicationController
  before_action :get_pokemon

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    url = "https://pokeapi.co/api/v2/pokemon/#{ @pokemon.name }/"
    @info = HTTParty.get url;
    @height = @info["height"]
    @weight = @info["weight"]
    @character_url = @info["species"]["url"]
    url2 = @character_url
    @info2 = HTTParty.get url2;
    @blurb = @info2["flavor_text_entries"][0]["flavor_text"]

  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new pokemon_params
    @pokemon.save
    redirect_to pokemons_path
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
