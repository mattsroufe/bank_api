class Customers < Grape::API
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
