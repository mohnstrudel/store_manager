require 'rails_helper'

describe SupplierOrder do
  # let!(:payment) { create(:payment, payable: order) }
  let(:order) { create(:supplier_order, price: 900, amount:2, supplier: "Supplier A") }
  let!(:payment_1) { create(:payment, amount: 100, payable: order) }
  let!(:payment_2) { create(:payment, amount: 244, payable: order) }

  it 'expects to have correct amount of orders' do
    expect(order.payments.count).to eq(2)
  end

  context 'when one supplier' do

    it 'expects to count debt correctly for one supplier' do
      # 900*2 = 1800 Gesamtpreis
      # bezahlt: 100 * 2, 244 * 2 = 688
      # Debt = 1112
      expect(SupplierOrder.debt[order.supplier]).to eq(1112)
    end
  end

  context 'when multiple suppliers' do
    let(:order2) { create(:supplier_order, price: 720, amount:2, supplier: "Supplier B") }
    let!(:payment_3) { create(:payment, amount: 120, payable: order2) }
    let!(:payment_4) { create(:payment, amount: 340, payable: order2) }

    it 'expects to have all payments' do
      expect(SupplierOrder.debt).to eq({ "Supplier A"=>1112.0,
                                        "Supplier B"=>520.0 })
    end

    it 'expects to count sum of the debt correctly for multiple suppliers' do
      # 1112.0 Supplier A
      # Supplier B: Gesamtpreis - 720*2 = 1440
      # bezahlt: 120*2 + 340*2 = 520.0
      expect(SupplierOrder.total_debt).to eq(1632)
    end
  end
end
