class ResidentsController < ApplicationController
  def index
    @residents = Resident.all
    if params[:search]
      @residents = Resident.search(params[:search]).order("created_at DESC")
    else
      @residents = Resident.all.order('created_at DESC')
    end
  end
end

