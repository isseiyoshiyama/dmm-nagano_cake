class HomesController < ApplicationController
  def top
    @items = Item.order("id DESC")
  end
end
