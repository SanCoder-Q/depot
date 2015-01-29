require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	setup do
		@product = Product.new description: 'MyText', image_url: 'MyString.gif', price: 9.99, title: 'MyString3'
	end

	test "product attributes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end

	test "product price must be positive" do
		@product.price = -1
		assert @product.invalid?
		assert_equal "must be greater than or equal to 0.01", @product.errors[:price].join(';')

		@product.price = 0
		assert @product.invalid?
		assert_equal "must be greater than or equal to 0.01", @product.errors[:price].join(';')

		@product.price = 1
		assert @product.valid?
	end

	test "image url must be a URL for GIF, JPG or PNG image" do
		ok = %w{ foo.gif foo.jpg foo.png foo.JPG foo.Jpg http://a.b.c/x/y/z/foo.gif }
		bad = %w{ bar bar.doc bar.doc/more bar.gif.more }

		ok.each do |url|
			@product.image_url = url
			assert @product.valid?, "#{url} shouldn't be invalid"
		end

		bad.each do |url|
			@product.image_url = url
			assert @product.invalid?, "#{url} shouldn't be valid"
		end
	end
end
