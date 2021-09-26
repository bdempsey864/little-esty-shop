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

    visit edit_merchant_bulk_discount_path(@merchant, @discount_1)
  end

  it 'has a form with current info' do
    expect(page).to have_field('bulk_discount[percentage_discount]', with: 20)
    expect(page).to have_field('bulk_discount[quantity_threshold]', with: 100)
  end

  it 'updates info and redirects to show page' do
    fill_in('bulk_discount[percentage_discount]', with: 15)
    fill_in('bulk_discount[quantity_threshold]', with: 55)
    click_button('Submit')
    expect(current_path).to eq(merchant_bulk_discount_path(@merchant, @discount_1))
    expect(page).to have_content(15)
    expect(page).to have_content(55)
  end
end