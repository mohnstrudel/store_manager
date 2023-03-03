require "rails_helper"

describe Product do
    # input
  # name: "Dragon Ball - Namek Saga Son Goku | 1:1 Resin Statue | von Infinite Studio"
  describe '#find_by_full_title' do
    let(:title) { 'Dragon Ball - Namek Saga Son Goku | 1:1 Resin Statue | von Infinite Studio' }
    let(:brand) { create(:brand, title: "Infinite Studio") }
    let(:franchise) { create(:franchise, title: "Dragon Ball") }

    it 'creates a new product if nothing found' do
      expect{
        Product.find_by_full_title(title)
      }.to change{ Product.count }.from(0).to(1)
    end

    it 'finds the product if its already here with simple params' do
      create(:product, title: "Namek Saga Son Goku", brand: brand, franchise: franchise, size: "1:1")
      params = { size: "1:1" }

      expect {
        Product.find_by_full_title(title, params)
      }.not_to change { Product.count }
    end

    it 'creates a new product if at least one parameter is different' do
      create(:product, title: "Namek Saga Son Goku", brand: brand, franchise: franchise, size: "1:1")
      params = { size: "1:1", version: "deluxe" }

      expect {
        Product.find_by_full_title(title, params)
      }.to change { Product.count }.from(1).to(2)

      expect(Product.last.version).to eq("deluxe")
    end
  end

  describe '#create_new_product' do
    let(:name) { ["Dragon Ball", "Namek Saga Son Goku", "1:4 Resin Statue", "vom LX Studio"]}

    it 'creates new product with just the title' do
      expect {
        Product.create_new_product(name)
      }.to change{ Product.count }.from(0).to(1)

      expect(Franchise.last.title).to eq(name[0])
      expect(Product.last.title).to eq(name[1])
      expect(Product.last.brand.title).to eq("LX Studio")
    end
  end
end
