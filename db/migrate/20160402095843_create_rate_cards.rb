class CreateRateCards < ActiveRecord::Migration
  def change
    create_table :rate_cards do |t|
      t.integer :daily_diet
      t.integer :establishment_charge
      t.integer :maintenance_charge
      t.integer :staff_welfare_charge
      t.integer :extra_charge
      t.references :hostel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
