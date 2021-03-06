class ApplicationController < ActionController::Base
  before_action :fetch_user

  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end

  def check_for_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin
  end

  ######################gets the list of all the pokemon and their names
  def get_pokemon
    @api_list = PokeApi.get(pokemon: {limit: 1200, offset: 0})
    @available_pokemon = []
    @api_list.results.each do |n|
      @available_pokemon << n.name
    end
  end

end
