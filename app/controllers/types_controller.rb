class TypesController < ApplicationController
  def index
    @types  = Type.all
    @type   = Type.new
  end
  def new
    @type = Type.new
  end
  def show
    @type = Type.find(params[:id])
  end
  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to types_path, notice: "Новый тип '" + @type.name + "' создан!"
    else
      render "new"
    end
  end
  def update
    @type = Type.find(params[:id])
    if @type.update(type_params)
      redirect_to types_path, notice: "Тип '" + @type.name + "' обновлен!"
    else
      render "show"
    end
  end
  def destroy
    type = Type.find(params[:id])
    type.destroy
    redirect_to types_path
  end

  private
  def type_params
    params.require(:type).permit( :name )
  end

end
