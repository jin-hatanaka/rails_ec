# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
6.times do |n|
  product = Product.create!(
    name: "太郎#{n + 1}",
    price: 500,
    description: 'テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト'
  )
  product.image.attach(io: File.open(Rails.root.join("app/assets/images/image#{n + 1}.jpg")),
                       filename: "image#{n + 1}.jpg")
end
