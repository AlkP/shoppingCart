class ProductsController < ApplicationController
  def index
    if current_user
      @product    = Product.new
      @products = Product.all
    else
      @products = Product.where('active = ?', true)
    end
  end
  def new
    @product    = Product.new
    @varieties  = Variety.all
    @varieties_first = Variety.where('type_id = ?', Type.all.first)
    @types = Type.all
  end
  def show
    @product = Product.find(params[:id])
    @varieties  = Variety.all
    @varieties_first = Variety.where('type_id = ?', @product.variety.type_id)
    @types = Type.all
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Новый продукт '" + @product.name + "' создан!"
    else
      @varieties  = Variety.all
      @varieties_first = Variety.where('type_id = ?', Type.all.first)
      @types = Type.all
      render "new"
    end
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: "Продукт '" + @product.name + "' обновлен!"
    else
      @varieties  = Variety.all
      @varieties_first = Variety.where('type_id = ?', Type.all.first)
      @types = Type.all
      render "show"
    end
  end
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit( :name, :variety_id, :price, :active )
  end
end
