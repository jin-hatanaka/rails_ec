# frozen_string_literal: true

class ChangeOrdersColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :product_name, :string

    remove_column :order_details, :product_id, :references
  end
end
