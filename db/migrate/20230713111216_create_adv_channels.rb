class CreateAdvChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :adv_channels do |t|
      t.string :channel_name
      t.string :sub_channal_name
      t.string :description
      t.boolean :is_active, default: true
      t.boolean :is_remove, default: false
      t.timestamps
    end
  end
end
