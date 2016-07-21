class BillsController < ApplicationController

  def new
     if admin_user_signed_in?
       @bill=Bill.new
     else
       flash[:danger]="Not Authorised!"
       redirect_to root_path
     end
  end


  def show
    @bills = current_user.resident.bills
  end

  def create
    hostel_id = Hostel.where(hostel: current_admin_user.hostel.capitalize).first.id
    residents = Resident.where(hostel_id:hostel_id)
    residents.each do |resident|
      resident.bills.create(bill_params)
    end
    redirect_to new_bill_path
    flash[:success] = "Bills Generated !!!"
  end

  def edit
    if admin_user_signed_in?
      @bill = User.find(params[:id])
    else
      flash[:danger]="Not Authorised!"
      redirect_to root_path
    end

  end

  def update
    hostel_id = Hostel.where(hostel: current_admin_user.hostel.capitalize).first.id
    residents = Resident.where(hostel_id:hostel_id)
    if residents.bill.update_attributes(bill_params)
      flash[:success] = "Bill paid !"
    else
      flash[:success] = "Try again !"

    end
  end

  private

  def bill_params
    params.require(:bill).permit(:from_date, :to_date, :expiry_date, :payment_mode, :is_paid, :paid_amount , :amount)
  end

end
