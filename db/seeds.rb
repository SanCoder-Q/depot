# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = []

products.push title: "苹果", description: "南非进口水果,多吃水果有益身心", image_url: "apple.jpg", price: 15.80
products.push title: "橘子", description: "澳洲进口水果,多吃水果有益身心", image_url: "orange.jpg", price: 6.00
products.push title: "香蕉", description: "日本进口水果,多吃水果有益身心", image_url: "banana.jpg", price: 5.50

Product.delete_all

products.each do |item|
	Product.create(item)
end