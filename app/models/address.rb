# == Schema Information
#
# Table name: addresses
#
#  id                 :integer          not null, primary key
#  zip_code           :string(255)
#  street             :string(255)
#  housenumber        :string(255)
#  housenumber_suffix :string(255)
#  city               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  profile_id         :integer
#  province_id        :integer
#
# Indexes
#
#  index_addresses_on_profile_id   (profile_id)
#  index_addresses_on_province_id  (province_id)
#

class Address < ActiveRecord::Base
    belongs_to :profile
    belongs_to :province
end
