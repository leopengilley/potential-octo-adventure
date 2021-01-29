class PokemonsController < ApplicationController
  before_action :get_pokemon

  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
  end

  def create ##You can only create a pokemon that exists in the PokeApi
    @pokemon = Pokemon.new pokemon_params
    if @available_pokemon.include? @pokemon[:name]
      @pokemon.save
      redirect_to pokemons_path
    else render :new
    end
  end

  def edit #####################Blocker: Assigning attacks to pokemon only in the user's bag.
    @pokemon = Pokemon.find params[:id]
    @attacks = @pokemon.attacks.all
  end

  def update
    pokemon = Pokemon.find params[:id]
    pokemon.update pokemon_params
    redirect_to bags_path
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    url = "https://pokeapi.co/api/v2/pokemon/#{ @pokemon.name }/"
    @info = HTTParty.get url;
    #Blurb about the pokemon, because it was too hard to access the 100 different attacks each pokemon has
    @character_url = @info["species"]["url"]
    url2 = @character_url
    @info2 = HTTParty.get url2;
    @blurb = @info2["flavor_text_entries"][0]["flavor_text"]
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :attack)
  end

end
