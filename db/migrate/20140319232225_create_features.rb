class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :location_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
