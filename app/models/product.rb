class Product < ApplicationRecord

  belongs_to :franchise
  belongs_to :brand

  def full_title
    begin
      "#{franchise.title} - #{title} | #{size} Resin Statue | von #{brand.title}"
    rescue
      title
    end
  end
end
