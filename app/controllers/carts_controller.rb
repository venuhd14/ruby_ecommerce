class CartsController < ApplicationController
  def show
    @cart = session[:cart] || []
    @cart.select! { |product_id| Product.exists?(product_id) }
    @products = Product.where(id: @cart)
  end

  def add
    product_id = params[:product_id]
    @cart = session[:cart] || []
    @cart << product_id
    session[:cart] = @cart
    Rails.logger.debug "Cart after adding product: #{session[:cart]}"
    redirect_to cart_path, notice: "Product added to the cart!"
  end

  
  def remove
    product_id = params[:product_id]
    @cart = session[:cart] || []
    @cart.delete(product_id)
    session[:cart] = @cart
    redirect_to cart_path, notice: "Product removed from the cart!"
  end
end
