class RemoveColumnFromTrips < ActiveRecord::Migration
  def change
  	remove_column :trips, :company_uri, :string
  end
end
