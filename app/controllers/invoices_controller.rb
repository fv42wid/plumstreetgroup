class InvoicesController < ApplicationController


  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @amount = 500
    @invoice = Invoice.find(params[:invoice_id])
    @customer = @invoice.customer

    if !@customer.stripe_customer_id
      customer = Stripe::Customer.create(
          :email => @customer.email,
          :source => params[:token]
      )
      customer.sources.create({source: params[:invoice][:token][:id]})
      @customer.stripe_customer_id = customer.id
      @customer.save
    else
      customer = Stripe::Customer.retrieve(@customer.stripe_customer_id)
    end



    charge = Stripe::Charge.create(
                               :customer => customer.id,
                               :amount => @invoice.amount,
                               :source => customer.default_source,
                               :description => @invoice.note,
                               :currency => 'usd'
    )

    ##TODO create charge
    @charge = @invoice.charges.new(customer_id: @customer.id, amount: @invoice.amount, stripe_charge_id: charge.id)
    @charge.save
    @invoice.update_attributes(paid: true, charge_id: @charge.id)

  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end

  private

    def invoice_params
      params.require(:invoice).permit(:token, :invoice_id)
    end
end