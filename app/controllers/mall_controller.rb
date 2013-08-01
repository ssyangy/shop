#encoding:utf-8
class MallController < ApplicationController
	def index
		@m_categories = MCategory.all
		@products = Product.all
	end
end
