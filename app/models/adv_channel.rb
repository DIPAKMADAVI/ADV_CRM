class AdvChannel < ApplicationRecord

  enum media_channel_name: ["Redio", "Newspaper","Television", "Hoarding", "Social Media", "Brochures"]
    
     def self.ransackable_attributes(auth_object = nil)
     end

     def self.ransackable_associations(auth_object = nil)
       []
     end

     def self.ransackable_attributes(auth_object = nil)
      ["channel_name", "created_at", "description", "id", "is_active", "is_remove", "sub_channal_name", "updated_at"]
    end

      # has_many :media_assets, class_name:'MediaAsset', foreign_key: 'sub_media_id'
      # belongs_to :departments, class_name: 'Department'
      # has_many :media_assets, class_name:'MediaAsset', foreign_key: 'sub_media_id'

      has_many :media_assets, class_name: 'MediaAsset', foreign_key: 'sub_media_id'

      
      
end
