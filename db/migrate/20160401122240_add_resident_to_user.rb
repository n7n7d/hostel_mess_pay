class AddResidentToUser < ActiveRecord::Migration
  def change
    add_column :users, :resident_id, :integer
  end
end
