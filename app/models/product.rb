class Product < ApplicationRecord

  belongs_to :franchise
  belongs_to :brand

  def full_title
    begin
      "#{franchise.title} - #{title} | #{size} Resin Statue | von #{brand.title} | #{version}"
    rescue
      title
    end
  end

  def self.find_by_full_title(name, params=nil)
    name = name.gsub("<span>", "").gsub("</span>","") # remove nasty <span></span>
    name = name.gsub("|", "-").split("-").map(&:strip)

    product_title = "#{name[0]} - #{name[1]} | #{name[2]} | #{name[3]}"

    product = Product.select { |product|
      product.full_title == product_title &&
      product.size == params[:size] &&
      product.color == params[:color] &&
      product.version == params[:version]
    }

    return product if product.present?

    create_new_product(name, params)
  end

  def self.create_new_product(name, params=nil)
    franchise = Franchise.find_or_create_by(title: name[0]).id
    brand = name[3].gsub("von ", "").gsub("vom ", "")
    brand = Brand.find_or_create_by(title: brand).id

    title = name[1]
    if params
      size = params[:size]
      color = params[:color]
      version = params[:version]
    end

    Product.create(title: title, size: size, color: color, version: version, franchise_id: franchise, brand_id: brand)
  end
end
