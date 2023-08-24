class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_dragon, only: %i[show edit update destroy]


  def index
    @dragons = Dragon.all
  end

  def my_dragons
    @dragons = Dragon.where(user: current_user)
  end

  def show
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

  def edit
  end

  def update
    if @dragon.update(dragon_params)
      redirect_to dragon_path(@dragon)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dragon.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end

  def dragon_params
    params.require(:dragon).permit(:name, :location, :category, :price_per_day, :description, :seats, :age)
  end
end
