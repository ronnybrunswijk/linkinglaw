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

class ZipCodeRange < ActiveRecord::Base
    belongs_to :province
    
    def self.find_province(zip_code)
       # TODO postcode validere
       region_code = zip_code.slice(0,4).to_i
       # TODO find one dwaan
       zip_code_ranges = ZipCodeRange.where(":region_code between first and last", {region_code: region_code})
       zip_code_ranges.first.province
       # TODO betinke wat 'r dien wurde moat as postcode net fun wurd.'
    end
end
