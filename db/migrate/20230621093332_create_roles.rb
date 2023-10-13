class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.text :description
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false

      t.timestamps
    end
  end
end
