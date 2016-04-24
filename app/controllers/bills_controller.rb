class BillsController < ApplicationController

  def new
    @bill=Bill.new
  end


  def show
    @bills = current_user.resident.bills
  end

end
