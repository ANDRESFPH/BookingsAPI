class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :title
      t.decimal :price_per_day
      t.decimal :price_per_week
      t.decimal :price_per_month
      t.references :store

      t.timestamps null: false
    end
  end
end
