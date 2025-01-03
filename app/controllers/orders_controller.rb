class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @order = Order.new
    if session[:cart].present?
      valid_product_ids = session[:cart].select { |id| Product.exists?(id) }
      @products = Product.where(id: valid_product_ids)
    else
      @products = []
    end
  end

  def show 
    @order = Order.find_by(id: params[:id])
    if @order.nil?
      flash[:alert] = "Order not found"
      redirect_to root_path
    end
  end

  def create
    Rails.logger.debug "Params: #{params.inspect}"
    @order = Order.new(order_params)
    @order.user = current_user
    @order.product_ids = session[:cart] || [] 
    @order.total_price = calculate_total_price(@order.product_ids)
    render json

    if @order.save
      session[:cart] = [] 
      redirect_to order_path(@order), notice: "Order placed successfully!"
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id)  
  end

  def calculate_total_price(product_ids)
    products = Product.find(product_ids)
    products.sum(&:price)
  end
end
