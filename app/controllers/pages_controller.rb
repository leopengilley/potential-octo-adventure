class PagesController < ApplicationController
  def home
    @current_bag = @current_user.bags.first
    @api_list = PokeApi.get(pokemon: {limit: 1200, offset: 0})
    @rand_pokemon = @api_list.results.sample
    @cpu_move = @rand_pokemon.moves{0}
  end

end
