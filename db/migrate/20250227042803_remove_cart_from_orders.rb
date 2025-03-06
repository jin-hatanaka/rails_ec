# frozen_string_literal: true

class RemoveCartFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :cart, null: false, foreign_key: true
  end
end
