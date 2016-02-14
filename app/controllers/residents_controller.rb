class ResidentsController < ApplicationController

  def new
  end

  def show
    @resident = Resident.find(params[:id])
  end

end
