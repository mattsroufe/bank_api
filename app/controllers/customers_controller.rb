class CustomersController < ApplicationController

  def index
    render json: Customer.with_accounts
  end

  def show
    render json: Customer.find(params[:id])
  end
end
