class MediaListForAdvertisementPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :advertisement_plans, :selected_media, :string
  end
end
