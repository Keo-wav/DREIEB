class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def my_orders
    @sells = current_user.sells
    @orders = current_user.orders
  end

  def new
    @drug = Drug.find(params[:drug_id])
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.user = current_user
    @order.drug = Drug.find(params[:drug_id])
    @order.status = "pending"
    if @order.save!
      redirect_to order_path(@order)
    else
      redirect_to new_drug_order_path(params[:drug_id]), status: :unprocessable_entity
    end
  end

  def approve
    @order = Order.find(params[:id])
    @order.update(status: 'approved')
    redirect_to "/#{current_user.id}/my_orders"
  end

  def decline
    @order = Order.find(params[:id])
    @order.update(status: 'decline')
    redirect_to "/#{current_user.id}/my_orders"
  end

  # def edit
  #   @order = Order.find(params[:id])
  # end

  # def update
  #   @order = Order.find(params[:id])
  #   @order.update(order_params)
  #   redirect_to order_path(@order)
  # end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to "/#{current_user.id}/my_orders", status: :see_other
  end

  private

  def order_params
    params.require(:order).permit(:status, :id, :drug_id)
  end
end
