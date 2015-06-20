class DiscountsController < ApplicationController
  def index
    @discounts = Discount.all
  end
  def new
    @discount = Discount.new
    @types = Type.all
    @varieties = Variety.all
    @varieties_first = Type.all.first.variety
    @products = Product.all
  end
  def show
    @discount = Discount.find(params[:id])
    @types = Type.all
    @varieties = Variety.all
    @varieties_first = @discount.type.variety.all
    @products = Product.all
    if @discount.variety.nil?
      @products_first = Product.where(id: 0)
    else
      @products_first = @discount.variety.product.all
    end
  end
  def create
    @discount = Discount.new(discount_params)
    if @discount.save
      redirect_to discounts_path, notice: "Новая скидка '" + @discount.name + "' создана!"
    else
      @types = Type.all
      @varieties = Variety.all
      @varieties_first = Type.all.first.variety
      @products = Product.all
      render "new"
    end
  end
  def update
    @discount = Discount.find(params[:id])
    if @discount.update(discount_params)
      redirect_to discounts_path, notice: "Скидка '" + @discount.name + "' обновлена!"
    else
      @types = Type.all
      @varieties = Variety.all
      @varieties_first = @discount.type.variety.all
      @products = Product.all
      @products_first = @discount.variety.product.all
      render "show"
    end
  end
  def destroy
    discount = Discount.find(params[:id])
    discount.destroy
    redirect_to discounts_path
  end

  private
  def discount_params
    params.require(:discount).permit( :name,
                                      :date_start,
                                      :date_end,
                                      :amount,
                                      :discount,
                                      :percent,
                                      :specification,

                                      :variety_id,
                                      :type_id,
                                      :product_id )
  end
end
