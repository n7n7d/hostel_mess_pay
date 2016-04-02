ActiveAdmin.register Hostel do
  permit_params :list, :of, :attributes, :on, :model, :hostel
  filter :hostel
end
