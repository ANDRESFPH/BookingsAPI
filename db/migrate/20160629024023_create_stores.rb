class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.string :opening_hours
      t.references :address
      t.references :organization

      t.timestamps null: false
    end
  end
end
