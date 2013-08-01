#encoding:utf-8
class ApplicationController < ActionController::Base
  before_filter :extract_cart

  def extract_cart
    @cart = session[:cart_id] ? Cart.find(session[:cart_id]) : Cart.create
    session[:cart_id] = @cart.id.to_s
  end
end
