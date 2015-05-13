class DeleteAmountFromPledges < ActiveRecord::Migration
  def change
    remove_column :pledges, :amount
  end
end
