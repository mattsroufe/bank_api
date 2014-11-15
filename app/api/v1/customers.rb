module V1
  class Customers < Grape::API
    version 'v1'

    resource :customers do
      desc "Returns all customers."
      get '/' do
        Customer.all
      end

      desc "Returns a single customer record."
      get '/:id' do
        Customer.find(params[:id])
      end
    end
  end
end
