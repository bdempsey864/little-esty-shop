class BulkDiscountsController < ApplicationController
  def index
    @merchants = Merchant.all
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = BulkDiscount.all
  end

  def show
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.new

  end

  def create

    merchant = Merchant.find(params[:merchant_id])
    discounts = merchant.bulk_discounts.create(bulk_discount_params)
    redirect_to "/merchants/#{merchant.id}/bulk_discounts"
  end

  private
  def bulk_discount_params
    params.require(:bulk_discount).permit(:percentage_discount, :quantity_threshold)
  end
end

