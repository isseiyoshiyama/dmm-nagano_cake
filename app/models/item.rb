class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :orders, through: :order_items
  
  #belongs_to :genre
  attachment :image
  
end
