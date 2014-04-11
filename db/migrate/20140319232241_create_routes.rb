class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :feature_id
      t.string :name
      t.text :description
      t.string :rating

      t.timestamps
    end
  end
end
