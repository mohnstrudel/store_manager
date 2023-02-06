class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to dashboard_index_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :brand_id, :franchise_id, :size, :version)
  end
end
