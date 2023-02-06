module Payable
  extend ActiveSupport::Concern

  def create
    @payment = @payable.payments.new(payment_params)

    respond_to do |format|
      if @payment.save
        redirect_to @payable
      else
        format.html { redirect_to @payable }
      end
    end
  end

  def payment_params
    params.require(:payment).permit(:amount)
  end
end