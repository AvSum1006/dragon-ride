class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @dragons = Dragon.all
  end

  def show
    @dragon = Dragon.find(params[:id])
  end

  def new
    @dragon = Dragon.new
  end

  def create
    @dragon = Dragon.new(dragon_params)
    @dragon.user = current_user
    if @dragon.save
      redirect_to dragon_path(@dragon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dragon_params
    params.require(:dragon).permit(:name, :location, :category, :price_per_day, :description, :seats, :age)
  end
end
