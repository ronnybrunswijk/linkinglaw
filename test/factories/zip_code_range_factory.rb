# == Schema Information
#
# Table name: zip_code_ranges
#
#  id          :integer          not null, primary key
#  first       :integer
#  last        :integer
#  created_at  :datetime
#  updated_at  :datetime
#  province_id :integer
#
# Indexes
#
#  index_zip_code_ranges_on_province_id  (province_id)
#

FactoryGirl.define do

    factory :zip_code_range do
        first 9850
        last 9879
        province { FactoryGirl.create(:province) }
    end
end
