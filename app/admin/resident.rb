ActiveAdmin.register Resident do
  permit_params :room_number,:roll_number,:name,:hostel
   index do
    column :room_number
    column :roll_number
    column :name
    column :hostel
    actions
  end
  filter :name,:as => :string
  filter :hostel, :as => :select
  filter :room_number
  filter :roll_number
end
