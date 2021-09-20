class Public::CartItemsController < ApplicationController
  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
  end

  def update
    @cartitem = CartItem.find(params[:id])
    @cartitem.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cartitem = CartItem.find(params[:id])
    @cartitem.destroy
    redirect_to cart_items_path
  end

  def destroyall
    #current_customer.cart_items.destroy_all
    @customer = current_customer
    @cart_items = @customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cartitem = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      #cart-itemを探している
      @cartitem.amount += params[:cart_item][:amount].to_i
      @cartitem.save
      redirect_to cart_items_path
    else
      @cartitem = CartItem.new(cart_item_params)
      @cartitem.customer_id = current_customer.id
      @cartitem.save
      redirect_to cart_items_path
    end


  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
