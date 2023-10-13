class Department < ApplicationRecord

     def self.ransackable_attributes(auth_object = nil)
         ["city", "created_at", "dept_name", "dept_state", "description", "id", "is_active", "is_remove", "updated_at"]
       end
       
       def self.ransackable_associations(auth_object = nil)
        []
      end
    
     has_many :users
    #  has_many :adv_channels, class_name:'AdvChannel'
    
    end
    