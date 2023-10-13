class CreateSelectedPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_plans do |t|
      t.references :advertisement_detail, horeign_key: {to_table: 'advertisement_details'}
      t.references :price_plan, horeign_key: {to_table: 'pricings'}
      t.references :business_detail, horeign_key:{to_table: 'business_details'}
      t.integer :scheme_count
      t.timestamps 
    end
  end
end
