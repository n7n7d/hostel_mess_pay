class CreateHostels < ActiveRecord::Migration
  def change
    create_table :hostels do |t|
      t.string :hostel

      t.timestamps null: false
    end
  end
end
