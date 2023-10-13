class CreateAdvertisementPlan < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisement_plans do |t|
      t.string :title_of_adv
      t.references :customer,  foreign_keys: {to_table: 'customer_infos'}
      t.references :adv_media, foreign_keys: {to_table: 'adv_channels'}
      t.references :business_detail, foreign_keys: {to_table: 'business_details'}
      t.string :placement, foreign_keys: {to_table: 'media_asset'}
      t.string :budget_plan , foreign_keys: {to_table: 'pricing'}
      t.datetime :est_start_date
      t.datetime :est_end_date
      t.string :adv_plan_status
      t.string :description
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      t.timestamps
    end
  end
end


