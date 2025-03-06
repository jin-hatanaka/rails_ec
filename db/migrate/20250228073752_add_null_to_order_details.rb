class AddNullToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    change_column :order_details, :product_name, :string, null: false
  end
end
