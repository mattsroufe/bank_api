class AccountsController < ApplicationController

  def index
    render json: Account.all
  end

  def show
    render json: Account.find(params[:id])
  end
end
