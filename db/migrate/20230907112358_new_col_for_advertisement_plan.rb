class NewColForAdvertisementPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :advertisement_plans, :customer_name, :string
  end
end
