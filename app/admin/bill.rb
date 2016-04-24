ActiveAdmin.register Bill do

  permit_params :from_date,:to_date,:expiry_date

  controller do
    def create
      if   @bill = Resident.all.each { |resident| resident.bills.create!(bill_params) }
        flash[:success]="Bills successfully generated"
        redirect_to collection_url
      else
        flash[:danger]="Something went wrong please try again !"
      end
    end

    private

    def bill_params
      params.require(:bill).permit(:to_date,:from_date,:expiry_date)
    end
  end

end
