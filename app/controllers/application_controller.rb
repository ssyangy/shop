#encoding:utf-8
class ApplicationController < ActionController::Base
  before_filter :extract_cart, :get_parent_category

  def get_parent_category
  	@p_categories = MCategory.where(:ancestry_depth => 1)
  end

  def extract_cart
    @cart = session[:cart_id] ? Cart.find(session[:cart_id]) : Cart.create
    session[:cart_id] = @cart.id.to_s
  end
end
