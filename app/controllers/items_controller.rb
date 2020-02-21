class ItemsController < ApplicationController
  before_action :set_department
  def index
    @items = @department.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = @department.items.new
    render partial: 'form'
  end

  def edit
    @item = Item.find(params[:id])
    render partial: 'form'
  end

  def create
    @item = @department.items.new(item_params)

    if @item.save
      redirect_to [@department, @item]

    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if (@department.update(item_params))
      redirect_to [@department, @item]
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to department_items_path(@department)
  end

  private 
    def set_department
      @department = Department.find(params[:department_id])
    end

    def item_params
      params.require(:item).permit(:name)
    end
end
