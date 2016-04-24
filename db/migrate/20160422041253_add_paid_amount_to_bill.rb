class AddPaidAmountToBill < ActiveRecord::Migration
  def change
    add_column :bills, :paid_amount, :integer
  end
end
