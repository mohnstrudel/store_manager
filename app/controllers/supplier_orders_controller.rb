class SupplierOrdersController < ApplicationController
  def index
    @supplier_orders = SupplierOrder.preload(product: [:brand, :franchise]).all
  end

  def show
    @supplier_order = SupplierOrder.find(params[:id])

    @debt = debt
  end

  def new
    @supplier_order = SupplierOrder.new
    @supplier_order.payments.build
  end

  def create
    @supplier_order = SupplierOrder.new(supplier_order_params)

    respond_to do |format|
      if @supplier_order.save
        format.html { redirect_to supplier_order_path(@supplier_order), notice: 'Supplier order was successfully created'}
        format.json { render :show, status: :created, location: @supplier_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplier_order = SupplierOrder.find(params[:id])

    @supplier_order.destroy

    respond_to do |format|
      format.html { redirect_to supplier_orders_path, notice: 'Supplier order was successfully destroyed'}
      format.json { head :no_content }
    end
  end

  private

  def supplier_order_params
    params.require(:supplier_order).permit(:paid, :price, :product_id, :supplier, :order_number, :amount,
                                            payments_attributes: [:id, :amount, :expense_id, :supplier_order_id, :_destroy])
  end

  def debt
    total_einkauf = @supplier_order.price * @supplier_order.amount

    total_bezahlt = @supplier_order.payments.pluck(:amount).sum * @supplier_order.amount

    total_einkauf - total_bezahlt
  end
end
