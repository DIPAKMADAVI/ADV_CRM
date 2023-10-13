class Pricing < ApplicationRecord
# belongs_to :media_assets, class_name: 'MediaAsset'
belongs_to :media_assets, class_name: 'MediaAsset', foreign_key: 'sub_media_id'
has_many :pricings


enum pricing_model: { "DAYS": 1, "WEEKLY": 2, "MONTHLY": 3 , "CUSTOM":4}
validates :price, presence:true, numericality: true
has_many :selected_plans, class_name:'SelectedPlan',  foreign_key: 'price_plan_id'

end
