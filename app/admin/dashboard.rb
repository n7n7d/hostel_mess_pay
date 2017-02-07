ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
        column do
          panel "Recent Posts" do
                 form partial: 'recent_posts'
          end
        end
      end
    end
end