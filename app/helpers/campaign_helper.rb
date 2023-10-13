module CampaignHelper

 def select_employee
     campaign_emp =  []
     users_with_dept_names = User.joins(:department)
       users_with_dept_names.each do |user|
          if user.department.dept_name == "Campaign Department"
               campaign_emp << [user.department.dept_name, user.id]
          end 
          puts campaign_emp 
       end     
  end 

#  def select_employee
#      campaign_emp = []
#      users_with_dept_names = User.joins(:department).where(departments: { dept_name: "Campaign Department" })
   
#      users_with_dept_names.each do |user|
#        campaign_emp << [dept_name: user.department.dept_name, user_id: user.id ]
#      end
   
#      # Print the campaign employees
#      puts campaign_emp
#    end

end
