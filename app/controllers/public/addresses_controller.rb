class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    #@__.モデル名でインスタンス変数に紐づいているモデルだけ取れる
    #rails2-5章のupdateアクションコントローラ
    @address = Address.new
  end


  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    p @address.save
    redirect_to addresses_path
  end


  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
