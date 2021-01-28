class PagesController < ApplicationController
  def home
    return redirect_to login_path unless @current_user.present?
    @api_list = PokeApi.get(pokemon: {limit: 1200, offset: 0})
    @rand_pokemon1 = @api_list.results.sample
  end

end
