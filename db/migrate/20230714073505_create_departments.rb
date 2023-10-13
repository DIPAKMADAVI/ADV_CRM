class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :dept_name
      t.string :dept_state
      t.string :city
      t.string :description
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      t.timestamps
    end
  end
end
