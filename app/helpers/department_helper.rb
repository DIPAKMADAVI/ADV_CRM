module DepartmentHelper


  def select_all_department
  if params[:action_name] == nil || params[:action_name].blank? || params[:action_name]== 'removed'
          Department.where(is_active:true).select(:dept_name).distinct.pluck(:dept_name,:id)
  else 
       Department.where(is_active:false).select(:dept_name).distinct.pluck(:dept_name,:id)
  end
  end 


   def select_dept_state  
       if params[:action_name] == nil || params[:action_name].blank? || params[:action_name]== 'removed'
      dept =    Department.where(is_active:true).select(:dept_name).distinct.pluck(:dept_name)
      else 
       dept = Department.where(is_active:false).select(:dept_name).distinct.pluck(:dept_name)
      end
    Department.where(dept_name:dept).select(:dept_state).distinct.pluck(:dept_state)
   end

   def select_dept_city
    department_name =[]
    select_all_department.each do |depts|
      department_name << depts[0]
    end 
    Department.where(dept_state:select_dept_state, dept_name:department_name).select(:city).distinct.pluck(:city)
   end

  

end
