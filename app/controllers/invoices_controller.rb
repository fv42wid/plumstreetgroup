class InvoicesController < ApplicationController

  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
                                   :email => 'frank@test.com',
                                   :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
                               :customer => customer.id,
                               :amount => @amount,
                               :description => 'Rails Stripe Customer',
                               :currency => 'usd'
    )


  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end
end