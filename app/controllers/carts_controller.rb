#encoding:utf-8
class CartsController < ApplicationController

  def create
    @product = Product.find(params[:pid])
    current_cart.add(@product, @product.price,params[:pcount].to_i)
    redirect_to :back
  end

end
