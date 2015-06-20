class VarietiesController < ApplicationController
  def index
    @variety    = Variety.new
    @varieties  = Variety.all
  end
  def new
    @variety = Variety.new
    @types = Type.all
  end
  def show
    @variety = Variety.find(params[:id])
    @types = Type.all
  end
  def create
    @variety = Variety.new(variety_params)
    if @variety.save
      redirect_to varieties_path, notice: "Новый сорт '" + @variety.name + "' создан!"
    else
      render "new"
    end
  end
  def update
    @variety = Variety.find(params[:id])
    if @variety.update(variety_params)
      redirect_to varieties_path, notice: "Тип '" + @variety.name + "' обновлен!"
    else
      render "show"
    end
  end
  def destroy
    variety = Variety.find(params[:id])
    variety.destroy
    redirect_to varieties_path
  end

  private
  def variety_params
    params.require(:variety).permit( :name, :type_id )
  end
end
