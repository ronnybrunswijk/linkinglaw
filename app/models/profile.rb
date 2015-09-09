# == Schema Information
#
# Table name: profiles
#
#  id                       :integer          not null, primary key
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#  first_name               :string(255)
#  last_name                :string(255)
#  phone                    :string(255)
#  profession               :string(255)
#  disciplinary_decision    :boolean
#  years_of_work_experience :integer
#  chamber_of_commerce_no   :string(255)
#  avatar_url               :string(255)
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ActiveRecord::Base
    has_and_belongs_to_many :practice_areas
    has_one :address
    has_many :endorsements
    has_many :answers, through: :endorsements
    has_many :reviews
    accepts_nested_attributes_for :address
    
    def full_name
       "#{first_name} #{last_name}" 
    end
    
    def self.retrieve(criteria)
        
        practice_area_id = criteria[:practice_area_id]
        province_id = criteria[:province_id]
        
        if !practice_area_id && !province_id
            self.all
        else
            #TODO query object meitsje mei query en params as properties
            query = ""
            params = {}
            tables = []
            if practice_area_id
                query << "practice_areas.id = :practice_area_id" 
                query << " and " if province_id
                params[:practice_area_id] = practice_area_id
                tables << :practice_areas
            end 
            
            if province_id
               query << "addresses.province_id = :province_id"
                params[:province_id] = province_id
                tables << :address
            end
            self.joins(tables).where(query, params)
        end
    end        
    
    # zero meeans not rated yet. 
    def calculate_rating
        
        divisor = 0
        rating_total = reviews.map(&:rating).inject(0.0) do |sum, rating |
           if rating
               divisor += 1
               sum + rating
           else 
               sum
           end
        end
         
        rating_avg = 0.0
        rating_avg = rating_total/divisor unless divisor == 0       
        rating_avg.round(1)
    end

end
