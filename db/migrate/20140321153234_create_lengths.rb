class CreateLengths < ActiveRecord::Migration
  def change
    create_table :lengths do |t|
      t.string :description

      t.timestamps
    end
  end
end
