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

require 'test_helper'

class ZipCodeRangeTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
     load "#{Rails.root}/db/seeds.rb"              
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'find province by zip code' do
    
    province = ZipCodeRange.find_province("1000AA")
    assert_equal "Noord-Holland", province.name
    
    province = ZipCodeRange.find_province("5825AA")
    assert_equal "Noord-Brabant", province.name

    province = ZipCodeRange.find_province("9999AA")
    assert_equal "Groningen", province.name
    
  end
  
# TODO implementere  
#  test 'find province by non-existant zip code' do
#  end

# TODO implementere  
#  test 'find province by null zip code' do
#  end

# TODO implementere  
#  test 'find province by invalid zip code' do
#  end
  
end
