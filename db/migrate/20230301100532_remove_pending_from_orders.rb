class RemovePendingFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :pending, :boolean
  end
end
