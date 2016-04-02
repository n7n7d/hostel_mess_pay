class RemoveHostelFromResident < ActiveRecord::Migration
  def change
    remove_column :residents, :hostel, :string
  end
end
