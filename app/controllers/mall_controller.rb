#encoding:utf-8
class MallController < ApplicationController
	def index
		if params[:p1] && params[:p2]
  		  @p_category = MCategory.find(params[:p1])
  		  @ch_category = MCategory.find params[:p2]
  		  @ch_categories = @p_category.children
		  @products = Product.selling.where(:m_category_id => @ch_category.subtree_ids)
		elsif params[:p1]
		  @p_category = MCategory.find(params[:p1])
		  @ch_categories = @p_category.children
  		  @products = Product.selling.where(:m_category_id => @p_category.subtree_ids)
		else
		  @ch_categories = MCategory.where(:ancestry_depth => 2)
		  @products = Product.selling.where(:m_category_id => MCategory.select('id').map(&:id))
		end
	end
end
