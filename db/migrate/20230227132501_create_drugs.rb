class CreateDrugs < ActiveRecord::Migration[7.0]
  def change
    create_table :drugs do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :category
      t.integer :delivery_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
