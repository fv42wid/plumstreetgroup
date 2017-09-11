class InvoicesController < ApplicationController


  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
                                   :email => 'jay@test.com',
                                   :source => invoice_params[:token]
    )

    customer.sources.create({source: params[:invoice][:token][:id]})

    #token = invoice_params[:token].to_h
    #byebug
    charge = Stripe::Charge.create(
                               :customer => customer.id,
                               :amount => @amount,
                               :source => customer.default_source,
                               :description => 'Rails Stripe Customer',
                               :currency => 'usd'
    )


  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end

  private

    def invoice_params
      params.require(:invoice).permit(:token)
    end
end