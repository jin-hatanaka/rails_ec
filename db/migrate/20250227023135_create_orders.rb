# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :country, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :name_on_card, null: false
      t.string :credit_card_number, null: false
      t.string :expiration, null: false
      t.integer :cvv, null: false
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
