ActiveAdmin.register RateCard do

 permit_params :daily_diet,:establishment_charge,:maintenance_charge,:staff_welfare_charge,:extra_charge,:hostel_id


index do
  column :hostel

  column :daily_diet do |product|
      number_to_currency  product.daily_diet,unit: "₹"
end
  column :establishment_charge do |product|
      number_to_currency  product.establishment_charge,unit: "₹"
end
  column :maintenance_charge do |product|
      number_to_currency  product.maintenance_charge,unit: "₹"
end
  column :staff_welfare_charge  do |product|
    number_to_currency  product.staff_welfare_charge,unit: "₹"
  end
  column :extra_charge do |product|
    number_to_currency  product.extra_charge,unit: "₹"
  end
  actions
end

end
