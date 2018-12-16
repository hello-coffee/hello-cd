class OrdersController < ApplicationController

  def new
  end

  def create
  end

  def index
    @orders = Orders.page(params:[page]).per(10)
  end
end
