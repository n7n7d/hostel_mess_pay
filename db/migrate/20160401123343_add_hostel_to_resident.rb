class AddHostelToResident < ActiveRecord::Migration
  def change
    add_column :residents, :hostel_id, :integer
  end
end
