class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.date :start_date
      t.date :end_date
      t.string :destination
      t.references :resident, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
