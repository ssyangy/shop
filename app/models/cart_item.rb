class CartItem < ActiveRecord::Base
	acts_as_shopping_cart_item_for :cart
	attr_accessible :item, :price, :quantity
end
