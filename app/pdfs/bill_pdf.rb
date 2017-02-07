class BillPdf < Prawn::Document


  def initialize(bill)
    super(top_margin: 70)
  @bill=bill
    bill_period
    line_items
  end


  def bill_period
    text "Hostel #{@bill.resident.hostel}\nThapar university\n Patiala, Punjab, IN 147001 ",size:10,align: :left
    text "Billing Period [#{@bill.from_date} - #{@bill.to_date}]",size:10,align: :right

    move_down 10
    text "Receipt",size:30,style: :bold, align: :center
  end

  def line_items
     move_down 30
     table line_item_rows
     total_done
  end

  def line_item_rows
    [["Details", "#", "Price","Total"]] +
        [["Daily Diet",(@bill.to_date-@bill.from_date).to_i ,@bill.resident.hostel.rate_card.daily_diet,((@bill.to_date-@bill.from_date).to_i*@bill.resident.hostel.rate_card.daily_diet)]]+
        [["Establishment Charges","-",@bill.resident.hostel.rate_card.establishment_charge,@bill.resident.hostel.rate_card.establishment_charge]]+
        [["Staff welfare Charges","-",@bill.resident.hostel.rate_card.staff_welfare_charge,@bill.resident.hostel.rate_card.staff_welfare_charge]]+
        [["Maintenance charges","-",@bill.resident.hostel.rate_card.maintenance_charge,@bill.resident.hostel.rate_card.maintenance_charge]]+
        [["Extra charges","-",@bill.resident.hostel.rate_card.extra_charge,@bill.resident.hostel.rate_card.extra_charge]]
  end
  def total_done
    move_down 10
    text "Total #{@bill.amount}",style: :bold,align: :left
  end
end