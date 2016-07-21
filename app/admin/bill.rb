ActiveAdmin.register Bill do

  permit_params :from_date,:to_date,:expiry_date,:amount

  sidebar "Info", only: [:new] do
    "This form will generate bills for all residents of your hostel i.e. hostel #{current_admin_user.hostel}."
  end

  controller do

      def new
        @bill=Bill.new
      end

      def edit
        @bill = User.find(params[:id])
      end
      def create
        hostel_id = Hostel.where(hostel: current_admin_user.hostel.capitalize).first.id
        residents = Resident.where(hostel_id:hostel_id)
        residents.each do |resident|
        resident.bills.create(bill_params)
      end
          redirect_to new_bill_path
    end
    private

     def bill_params
        params.require(:bill).permit(:to_date, :from_date, :expiry_date)
     end
  end
  form  do |f|
    f.semantic_errors *f.object.errors.keys
    inputs "Generate Bills for Hostel #{current_admin_user.hostel}" do
      input :from_date, as: :datepicker, datepicker_options: { min_date: "-1y",max_date: "+1Y" }
      input :to_date, as: :datepicker, datepicker_options: { min_date: "-1y",max_date: "+1Y" }
      input :expiry_date, as: :datepicker, datepicker_options: { min_date: "-1y",max_date: "+1Y" }
      actions
    end
  end
  form partial: 'form'

end
