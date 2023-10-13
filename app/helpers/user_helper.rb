module UserHelper

     def select_all_role
          excluded_role_names = ['Super admin']
          Role.where.not(role_name: excluded_role_names).pluck(:role_name,:id)
        
     end
end
