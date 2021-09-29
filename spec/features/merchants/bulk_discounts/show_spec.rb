require 'rails_helper'

RSpec.describe 'bulk discount show page' do
  before(:each) do
    @merchant    = create(:merchant)

    @good_item_1 = create(:item, merchant_id: @merchant.id)
    @g_in_item_1 = create(:invoice_item, item_id: @good_item_1.id)
    @g_in_item_2 = create(:invoice_item, item_id: @good_item_1.id)

    @good_item_3 = create(:item, merchant_id: @merchant.id, name: 'pickles')
    @g_in_item_3 = create(:invoice_item, item_id: @good_item_3.id, status: 1)

    @good_item_4 = create(:item, merchant_id: @merchant.id, name: 'biscuits')
    @g_in_item_4 = create(:invoice_item, item_id: @good_item_4.id, status: 1)

    @bad_item_1  = create(:item, merchant_id: @merchant.id, name: 'candy')
    @b_in_item_1 = create(:invoice_item, item_id: @bad_item_1.id, status: 2)
    @bad_item_2  = create(:item, merchant_id: @merchant.id, name: 'walnuts')
    @b_in_item_2 = create(:invoice_item, item_id: @bad_item_2.id, status: 3)

    @discount_1 = create(:bulk_discount)
    @discount_2 = create(:bulk_discount)

    visit merchant_bulk_discount_path(@merchant, @discount_1)
  end

  it 'shows quantity threshold and percentage discount' do
    expect(page).to have_content("Quantity Threshold: #{@discount_1.quantity_threshold}")
    expect(page).to have_content("Percentage Discount: #{@discount_1.percentage_discount}%")
  end

  it 'has a link to edit discounts' do  
    expect(page).to have_link("Edit Discount #{@discount_1.id}")
    click_link("Edit Discount #{@discount_1.id}")
    expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant, @discount_1))
  end
end