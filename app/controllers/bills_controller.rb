class BillsController < ApplicationController

  def index

  end


  def new
     if admin_user_signed_in?
       @bill=Bill.new
     else
       flash[:danger]="Not Authorised!"
       redirect_to root_path
     end
  end


  def show
    if admin_user_signed_in?
      @resident = Resident.find(params[:id])
      @bills = @resident.bills
    else
      flash[:danger]="Not authoriesed!"
      redirect_to root_path
    end
  end

  def create
    if admin_user_signed_in?
    hostel_id = Hostel.where(hostel: current_admin_user.hostel.capitalize).first.id
    residents = Resident.where(hostel_id:hostel_id)
    residents.each do |resident|
      resident.bills.create(bill_params)
    end
    redirect_to new_bill_path
    flash[:success] = "Bills Generated !!!"
      end
  end

  def edit
    if admin_user_signed_in?
      @bill = Bill.find(params[:id])
    else
      flash[:danger]="Not Authorised!"
      redirect_to root_path
    end

  end

  def update
    if admin_user_signed_in?
      @bill=Bill.find(params[:id])
   if  @bill.update_attributes(bill_params)
      flash[:success] = "Bill paid !"
       render 'residents/index'
    else
      flash[:danger] = "SOMETHING WENT WRONG TRY AGAIN "
      render 'edit'
      end
    end
  end
def user_bills
  if logged_in?
    @bills=current_user.resident.bills

  else
    redirect_to root_path
  end
end
  def pdf_gen
    if logged_in?
   @bill=Bill.find(params[:id])
   respond_to do |format|
     format.html
     format.pdf do
       pdf= BillPdf.new(@bill)
       send_data  pdf.render,  filename: "bill_#{@bill.from_date} - #{@bill.to_date}.pdf",
                               type: "application/pdf",
                               disposition: "inline"
     end
   end
     end
   end
  private

  def bill_params
    params.require(:bill).permit(:from_date, :to_date, :expiry_date, :payment_mode, :is_paid, :paid_amount , :amount)
  end

end
