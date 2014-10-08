class CustomersController < ApplicationController

  def index
    render json: Customer.includes(:accounts, :business, :individual).all
  end

  def show
    render json: Customer.find(params[:id])
  end
end
