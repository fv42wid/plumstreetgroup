class ChargesController < ApplicationController

  def show
    @charge = Charge.find(params[:id])
    render json: {charge: @charge}
  end
end