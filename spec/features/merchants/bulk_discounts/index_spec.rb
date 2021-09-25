require 'rails_helper'

RSpec.describe 'bulk discount index page' do
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

    visit merchant_bulk_discounts_path(@merchant)
  end

  it 'lists all of my bulk discounts' do
    expect(page).to have_content(@discount_1.percentage_discount)
    expect(page).to have_content(@discount_2.percentage_discount)
    expect(page).to have_content(@discount_1.quantity_threshold)
    expect(page).to have_content(@discount_2.quantity_threshold)
    expect(page).to have_link("See Discount #{@discount_1.id}")
    expect(page).to have_link("See Discount #{@discount_2.id}")
    click_link("See Discount #{@discount_1.id}")
  end

  it 'it has a link to and takes me to create a new discount' do
    expect(page).to have_link("New Discount")
    click_link("New Discount")
    expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant))
  end

  it 'creates a new discount' do 
    visit new_merchant_bulk_discount_path(@merchant)
    fill_in "Percentage discount", with: 10
    fill_in "Quantity threshold", with: 45
    click_on "Submit"
    expect(current_path).to eq(merchant_bulk_discounts_path(@merchant))
    expect(page).to have_content(@discount_1.percentage_discount)
    expect(page).to have_content(@discount_2.percentage_discount)
    expect(page).to have_content(@discount_1.quantity_threshold)
    expect(page).to have_content(@discount_2.quantity_threshold)
    expect(page).to have_content(10)
    expect(page).to have_content(45)
  end
end