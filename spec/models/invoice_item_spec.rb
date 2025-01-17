require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'relationships' do
    it { should belong_to :item }
    it { should belong_to :invoice }
  end

  describe 'enums' do
    it { should define_enum_for(:status) }

    it 'can be packaged' do
      invoice_item = build(:invoice_item)
      expect(invoice_item.status).to eq('packaged')
    end

    it 'can be pending' do
      invoice_item = build(:invoice_item, status: 1)
      expect(invoice_item.status).to eq('pending')
    end

    it 'can be shipped' do
      invoice_item = build(:invoice_item, status: 2)
      expect(invoice_item.status).to eq('shipped')
    end

    it 'can be unknown' do
      invoice_item = build(:invoice_item, status: 3)
      expect(invoice_item.status).to eq('unknown')
    end
  end

  describe '#instance methods' do
    before(:each) do
      @item     = create(:item)
      @inv_item = create(:invoice_item, item_id: @item.id)
    end

    describe 'item_name' do
      it 'returns an item name' do
        expect(@inv_item.item_name).to eq(@item.name)
      end
    end

    describe '#formatted_date' do
      it 'returns the creation date of the invoice' do
        invoice = create(:invoice, created_at: 'Sun, 19 Sep 2021 11:11:11 UTC +00:00')
        invoice_item = create(:invoice_item, invoice_id: invoice.id)
        expect(invoice_item.formatted_date).to eq("Sunday, September 19, 2021")
      end
    end
  end
end
