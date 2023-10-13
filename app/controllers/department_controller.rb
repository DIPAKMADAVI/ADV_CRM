class DepartmentController < ApplicationController
  

  
  def index
    if (params[:action_name]=="removed" || params[:action]=="index" ) 
      @q = Department.ransack(params[:q])
      @department = @q.result(distinct: true).where(is_active: true).paginate(page: params[:page], per_page: 10) 
   end  
    if params[:action_name]=="active"
       @q = Department.ransack(params[:q])
       @department = @q.result(distinct: true).where(is_active: false ).paginate(page: params[:page], per_page: 10) 
   end 
      
  rescue => e
    redirect_to department_path, notice: "An error occurred: #{e.message}"



  end

  def add_dept
    is_exists = Department.where(dept_name: params[:dept][:dept_name],dept_state:params[:dept][:dept_state],city:params[:dept][:city])
    if is_exists.present?
        @error = "Department Is   Already Exists"
      else        
        add_dept_data= params.require(:dept).permit(:dept_name, :dept_state, :city, :description)
        add_dept_data[:is_active]=true
        add_dept_data[:is_remove]=false 
        dept = Department.create!(add_dept_data)
        if dept
        # @error=" dept save successfully"
        redirect_to department_path, notice: 'Record Saved  successfully.'
        else 
        # @error="unable to save dept, something went wrong"
        redirect_to department_path, notice: 'unable to save dept, something went wrong'

        end 
    end 
  rescue => e
    redirect_to department_path, notice: "An error occurred: #{e.message}"

  end

  def show 
    params[:id]= params[:format]
    @department = Department.find(params[:id])
   
  end 


    def update_dept
      @department = Department.find(params[:id])
      params[:dept_state]=params[:update_dept_state]
      update_params = params.permit(:id,:dept_name,:dept_state,:city, :description )
      if @department.update(update_params)
        redirect_to department_path, notice: 'Record updated successfully.'
      else
        redirect_to department_path, notice: 'Something went wrong..not updated'
      end

    rescue => e
      redirect_to department_path, notice: "An error occurred: #{e.message}"
  
    end



    def remove_dept
  
        dept = Department.find(params[:id])
        removed_dept= dept.update(is_active:false, is_remove:true) if params[:dept_action]=="deactivate"
        removed_dept= dept.update(is_active:true, is_remove:false) if params[:dept_action]=="activate"
        if removed_dept
        redirect_to department_path, notice: 'records is  successfully  ' + params[:dept_action] + ''  
        else 
        redirect_to department_path, alert: 'sowmthing went wrong unable to remove the record plz try again.'
        end 

      rescue => e
      redirect_to department_path, notice: "An error occurred: #{e.message}"
    
    end






  private


end