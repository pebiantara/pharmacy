class Api::V1::ProductsController < Api::ApiController

  def index
    render json: [{id: 1, name: 'product1'}, {id: 2, name: 'product2'}, {id: 2, name: 'product3'}]
  end
end