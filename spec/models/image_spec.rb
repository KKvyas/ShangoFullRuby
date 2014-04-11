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

require 'spec_helper'

describe Image do
	before do
		@image = Image.new()
	end

	subject { @image }

	it { should be_valid }
end
