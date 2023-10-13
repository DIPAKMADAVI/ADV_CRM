class User < ApplicationRecord

  validates :phone_no_eq, presence: true, numericality: {  }, length: { is: 10 }

   def self.ransackable_attributes(auth_object = nil)
    ["alternate_phone_no", "city", "created_at", "created_by", "current_sign_in_at", "current_sign_in_ip", "date_of_birth", "department_id", "district", "email", "firstname", "gender", "hire_date", "id", "is_active", "is_remove", "last_sign_in_at", "last_sign_in_ip", "lastname", "password_digest", "phone_no", "role_id", "state", "status", "updated_at", "user_address", "username","department", "role"]
  end


 
   belongs_to :role, class_name: 'Role', foreign_key:'role_id'
   belongs_to :department

    has_secure_password

     def is_super_admin?
          self.role_id == 4 #'super admin'
        end
      
        def is_admin?
          self.role_id == 1 #'admin'
        end
      
        def is_agent?
          self.role_id == 2 # 'agent'
        end
      
        def is_supervisor?
          self.role_id ==  3 #'supervisor'
        end
      
end
