class AddHostelToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :hostel, :string
  end
end
