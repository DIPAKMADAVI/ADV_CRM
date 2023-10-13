class CreateMediaAsset < ActiveRecord::Migration[7.0]
  def change
    create_table :media_assets do |t|
      t.string :media_type
      t.references :sub_media, foreign_key: { to_table: 'adv_channels' }
      t.string :state
      t.string :district
      t.string :town_city
      t.string :area_location
      t.integer :dimentions
      t.decimal :number_of_count
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      t.timestamps
    end
  end
end
