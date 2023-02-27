class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :drug, null: false, foreign_key: true

      t.timestamps
    end
  end
end
