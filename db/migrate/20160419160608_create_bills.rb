class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.date :from_date
      t.date :to_date
      t.date :expiry_date
      t.integer :amount
      t.string :payment_mode
      t.boolean :is_paid
      t.references :resident, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
