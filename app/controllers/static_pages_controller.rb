class StaticPagesController < ApplicationController

  def home
    if logged_in?
      redirect_to @current_user
    else
      root_path
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def developers
  end

end
