class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroyall
  end

  def create
    @cartitem = CartItem.new(cart_item_params)
    @cartitem.customer_id = current_customer.id
    @cartitem.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
