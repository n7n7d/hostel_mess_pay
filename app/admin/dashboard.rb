ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

 columns do
   column do
     panel "Generate Bills" do

        render partial: 'form'

     end
   end
   column do
     panel "Pay Bills" do

     end
   end

 end
  end
end

