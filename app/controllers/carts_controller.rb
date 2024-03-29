#encoding:utf-8
class CartsController < ApplicationController

  def index
    @current_cart = current_cart
    @shopping_cart_items = @current_cart.shopping_cart_items.includes(:item)
  end

  def create
    @product = Product.selling.find(params[:pid])
    current_cart.add(@product, @product.price,params[:pcount].to_i)
    redirect_to :back
  end

  def delete_item
  	@product = Product.find params[:pid]
  	current_cart.remove(@product, params[:pcount].to_i)
  	redirect_to :back
  end

end
