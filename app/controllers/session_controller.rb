class SessionController < ApplicationController
  def new
    @api_list = PokeApi.get(pokemon: {limit: 1200, offset: 0})
    @rand_pokemon1 = @api_list.results.sample
  end

  def create
    user = User.find_by :name => params[:name]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid username"
      redirect_to login_path
    end
  end


  def destroy
      session[:user_id] = nil
      redirect_to login_path
  end
end
