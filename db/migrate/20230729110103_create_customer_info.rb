class CreateCustomerInfo < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :cust_email
      t.string :phone_number
      t.string :customer_state
      t.string :customer_district
      t.string :cust_address
      t.string :gender
      t.string :profile_pic
      t.integer :customer_status
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      t.timestamps
    end
  end
end
