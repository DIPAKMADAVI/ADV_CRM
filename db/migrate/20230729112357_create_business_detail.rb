class CreateBusinessDetail < ActiveRecord::Migration[7.0]
  def change
    create_table :business_details do |t|
      t.string :business_name
      t.references :customer,  foreign_keys: {to_table: 'customer_infos'}
      t.string :business_sector
      t.string :business_landline_number
      t.string :business_mobile_number
      t.string :business_state
      t.string :business_district
      t.string :business_mail
      t.string :business_address
      t.string :business_website
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      t.timestamps 
    end
  end
end
