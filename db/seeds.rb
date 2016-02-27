# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ["Computer", "Geek", "Food", "Sports", "Entertainment"]

categories.each do |category|
  unless Category.exists?(name: category)
    Category.create(name: category)
  end
end

unless User.exists?(email: "admin@exmaple.com")
  User.create(email: "admin@example.com", password: "password", admin: true)
end

unless User.exists?(email: "user@example.com")
  User.create(email: "user@example.com", password: "password")
end
