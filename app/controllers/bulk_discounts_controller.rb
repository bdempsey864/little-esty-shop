class BulkDiscountsController < ApplicationController
  before_action :current_merchant
  
  def index
    @discounts = BulkDiscount.all
  end

  def show
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @discount = BulkDiscount.new
  end

  def create
    discounts = @merchant.bulk_discounts.create(bulk_discount_params)
    redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
  end

  def destroy
    @discount = BulkDiscount.find(params[:id])
    @discount.destroy
    redirect_to merchant_bulk_discounts_path(@merchant)
  end

  private
  def bulk_discount_params
    params.require(:bulk_discount).permit(:percentage_discount, :quantity_threshold)
  end

  def current_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end
end

