class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_digest 
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :last_sign_in_ip
      t.string :current_sign_in_ip
      t.datetime :date_of_birth 
      t.string :gender
      t.references :role, foreign_keys: {to_table:'roles'}, null: false
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :phone_no
      t.string :state 
      t.string :district
      t.string :city
      t.string :user_address
      t.string :alternate_phone_no
      t.integer :status
      t.integer :created_by 
      t.references :department, foreign_key: { to_table: 'departments' }, null: true
      t.date :hire_date
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      
      t.timestamps
    end
  end
end
