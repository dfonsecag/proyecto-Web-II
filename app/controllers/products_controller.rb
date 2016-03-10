class ProductsController < ApplicationController
 before_action :set_product, only: [:show, :edit, :update, :destroy]
 before_action :token, only: [ :index, :show, :destroy, :create, :edit]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    if name = params[:name]
     @products = Product.where(name: name)
   else
   end
   render json: @products, status: :ok 
 end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
   product = Product.new()
   product.name = (params[:name])
   product.description = (params[:description])
   product.estado = (params[:estado])
   if product.save
    render json: 'Created', status: :ok 
  else
    render json: product.errors, status: :unprocessable_entity 
  end  
end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    product = Product.find_by id: (params[:id])
    product.name = (params[:name])
    product.description = (params[:description])
    product.estado = (params[:estado])
    if product.save
      render json: 'Updated', status: :ok 
    else
      render json: product.errors, status: :unprocessable_entity 
    end  
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    render json: 'Deleted', status: :ok 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :estado)
    end
  end
