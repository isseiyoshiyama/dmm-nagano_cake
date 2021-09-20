class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :orders, through: :order_items
  
  #belongs_to :genre
  attachment :image
  
  ## 消費税を求めるメソッド
  def with_tax_price
      (price * 1.1).floor
  end
  
end
