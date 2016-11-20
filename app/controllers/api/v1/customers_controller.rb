class Api::V1::CustomersController < Api::ApiController

  def index
    render json: [{id: 1, name: 'customer 1'}, {id: 2, name: 'customer 2'}, {id: 2, name: 'customer 3'}]
  end
end