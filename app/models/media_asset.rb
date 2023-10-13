class MediaAsset < ApplicationRecord
     
     def self.ransackable_attributes(auth_object = nil)
          ["media_type", "sub_media_type", "state", "district", "town_city", "area_location", "dimentions", "number_of_count", "is_active", "is_remove", "created_at", "updated_at"]
     end
     
     def self.ransackable_associations(auth_object = nil)
          []
     end

# belongs_to :departments
 belongs_to :adv_channel, foreign_key: 'sub_media_id'
 has_many :advertisement_plans, class_name: 'AdvertisementPlan'
 has_many :pricings, class_name:'Pricing'
#  belongs_to :adv_channel, foreign_key: 'sub_media_id', primary_key: 'sub_channal_name'
end 
