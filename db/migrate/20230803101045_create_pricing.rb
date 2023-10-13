class CreatePricing < ActiveRecord::Migration[7.0]
  def change
    create_table :pricings do |t|
      t.references :sub_media, horeign_key: {to_table: 'media_assets'}
      t.string :price_scheme 
      t.boolean :is_accupied, default: false
      t.decimal :price, precision: 10, scale: 2
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      t.timestamps
    end
  end
end

