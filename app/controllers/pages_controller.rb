class PagesController < ApplicationController
  def home
    return redirect_to login_path unless @current_user.present?
  end

end
