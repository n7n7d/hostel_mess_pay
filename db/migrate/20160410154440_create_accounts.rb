class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :fine
      t.integer :leaves
      t.integer :last_month_adjustment
      t.references :resident, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
