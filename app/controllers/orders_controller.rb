class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @drug = Drug.find(params[:drug_id])
  end

  def new
    @drug = Drug.find(params[:drug_id])
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.user = current_user
    @order.drug = Drug.find(params[:drug_id])
    @order.status = false
    p @order
    if @order.save
      redirect_to drug_path(params[:drug_id])
    else
      redirect_to new_drug_order_path(params[:drug_id]), status: :unprocessable_entity
    end
  end

  def order_confirm
    @order = Order.find(params[:id])
    @order.status = true
  end

  def order_decline
    @order = Order.find(params[:id])
    @order.status = false
  end

  # def edit
  #   @order = Order.find(params[:id])
  # end

  # def update
  #   @order = Order.find(params[:id])
  #   @order.update(order_params)
  #   redirect_to order_path(@order)
  # end

  # def destroy
  #   @order = Order.find(params[:id])
  #   @order.destroy
  #   redirect_to orders_path, status: :see_other
  # end

  private

  def order_params
    params.require(:order).permit(:status, :id, :drug_id)
  end
end
