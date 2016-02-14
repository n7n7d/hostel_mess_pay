class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :room_number
      t.string :roll_number
      t.string :name
      t.string :hostel

      t.timestamps null: false
    end
  end
end
