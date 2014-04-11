# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  activity_id        :integer
#  location_id        :integer
#  feature_id         :integer
#  route_id           :integer
#  client_id          :integer
#  guide_id           :integer
#  trip_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer
#  asset_updated_at   :datetime
#

class Image < ActiveRecord::Base
	has_attached_file :asset, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/

	belongs_to :activity
end
