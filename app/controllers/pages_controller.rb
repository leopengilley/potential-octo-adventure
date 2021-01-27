class PagesController < ApplicationController
  def home
    # @current_bag = @current_user.bags.first
    @api_list = PokeApi.get(pokemon: {limit: 1200, offset: 0})
    @rand_pokemon = @api_list.results.sample
    # @pokemon1 = @current_bag.pokemons.first
    # @pokemon2 = @current_bag.pokemons.second
    # @pokemon3 = @current_bag.pokemons.third
    # @attack1 = @pokemon1.attacks.first
  end

end
