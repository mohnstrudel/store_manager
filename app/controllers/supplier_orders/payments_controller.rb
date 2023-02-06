class SupplierOrders::PaymentsController < ApplicationController
  include Payable
  before_action :set_payable

  private

  def set_payable
    @payable = SupplierOrder.find(params[:supplier_order_id])
  end
end