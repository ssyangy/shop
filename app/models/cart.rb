class Cart < ActiveRecord::Base
    attr_accessible :user_id
	acts_as_shopping_cart_using :cart_item
	belongs_to :user
end
