class CreateCompanyGuides < ActiveRecord::Migration
  def change
    create_table :company_guides do |t|
      t.integer :company_id
      t.integer :guide_id
      t.boolean :guide_confirmed
      t.boolean :company_confirmed

      t.timestamps
    end
  end
end
