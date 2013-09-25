class InventoriesController < ApplicationController

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new( inventory_params )
    if @inventory.save
      redirect_to inventories_path, notice: 'Success'
    else
      render :new
    end
  end

  def index
    @inventories = Inventory.all
  end

  private
  def inventory_params
    params.require(:inventory).permit(:title, :description, :quantity)
  end

end
