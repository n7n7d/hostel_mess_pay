ActiveAdmin.register Resident do
   permit_params :room_number,:roll_number,:name,:hostel,:hostel_id
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

   form do |f|
     f.semantic_errors *f.object.errors.keys
     inputs 'Enter the student details' do
       input :room_number
       input :roll_number
       input :name
       input :hostel
       actions
     end
   end
end
