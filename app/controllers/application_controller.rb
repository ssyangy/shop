#encoding:utf-8
class ApplicationController < ActionController::Base
  before_filter :get_parent_category
  helper_method :current_user, :current_cart

  def get_parent_category
  	@p_categories = MCategory.where(:ancestry_depth => 1)
  end

  def current_cart
	@current_cart = session[:cart_id] && Cart.find_by_id(session[:cart_id]) ? Cart.find(session[:cart_id]) : Cart.create
  	if current_user 
  		if current_user.cart && current_user.cart != @current_cart
  			current_user.cart.shopping_cart_items.each do |item|
   				@current_cart.add(item.item,item.price,item.quantity)
  			end
  			current_user.cart.destroy
  		end
  		@current_cart.user = current_user
  		@current_cart.save
  	end
  	session[:cart_id] = @current_cart.id
  	return @current_cart
  end

  def current_user
  	@current_user ||= User.find_by_id session[:user_id]
  end

end
