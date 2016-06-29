class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :title
      t.text :description
      t.string :org_type
      t.timestamps null: false
    end
  end
end
