ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      form partial: 'bills/form'


      column do
        link_to image_tag("pay1.jpg",height: "200",width: "200"), new_bill_path

      end

      column do
        link_to image_tag("pay2.jpg",height: "200",width: "200"), bill_path
      end

  column do
    panel "Recent Customers" do
      table_for Resident.all  do
        column "Name",  :name
        column "Roll number",  :roll_number

      end
    end
  end
    end

 end
end