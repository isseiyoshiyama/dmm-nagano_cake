class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm

    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)

    end
    #redirect_to orders_confirm_path

    @customer = current_customer
    @cart_items = @customer.cart_items

  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.amount = cart.amount
        order_item.price = cart.item.price
        order_item.save
      end
    end
    redirect_to orders_complete_path
    cart_items.destroy_all

  end

  def index
    @customer = current_customer
    @orders = @customer.orders.all
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_fee)
  end
end
