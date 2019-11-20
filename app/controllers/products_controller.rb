class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = policy_scope(Product)
  end

  def show
    # @product = Product.find(params[:id])
    # authorize @product
    @rental = Rental.new
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = current_user.products.build(params_product)
    authorize @product
    if @product.save
      redirect_to @product, notice: "Procuct successfully created"
    else
      render :new
    end
  end

  def edit
    # @product = Product.find(params[:id])
    #authorize @product
  end

  def update
    # @product = Product.find(params[:id])
    # authorize @product
    if @product.update(params_product)
      redirect_to @product, notice: "Procuct successfully updated"
    else
      render :edit
    end
  end

  def destroy
    #authorize @product
    @product.destroy
    redirect_to products_path, notice: "Procuct successfully deleted"
  end

  private

  def params_product
    params.require(:product).permit(:category, :brand, :description, :status, :price, :address, :city, photos: [])
  end

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end
end
