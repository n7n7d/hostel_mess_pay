class ResidentsController < ApplicationController
  def index
    if admin_user_signed_in?
    @residents = Resident.all
    if params[:search]
      @residents = Resident.search(params[:search]).order("created_at DESC")
    else
      @residents = Resident.all.order('created_at DESC')
    end
    else
      flash[:danger]="Not Available"
     end
  end

  def show
    @bills = @residents.bills
  end
end

