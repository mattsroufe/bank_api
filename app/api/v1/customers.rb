module V1
  class Customers < Grape::API
    version 'v1'

    resource :customers do
      desc "Returns all customers."
      get '/' do
        Customer.all
      end

      desc "Returns a single customer record."
      params do
        requires :id, type: Integer, desc: "Customer id."
      end
      get '/:id' do
        Customer.find(params[:id])
      end

      desc "Returns a single customer's accounts"
      params do
        requires :id, type: Integer, desc: "Customer id."
      end
      get '/:id/accounts' do
        Customer.find(params[:id]).accounts
      end
    end
  end
end
