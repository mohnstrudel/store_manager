class BrandsController < ApplicationController

  def index
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    @brand.save
  end

  private

  def brand_params
    params.require(:brand).permit(:title)
  end
end
