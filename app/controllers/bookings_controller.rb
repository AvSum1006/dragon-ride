class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @dragon = Dragon.find(params[:dragon_id])
    @booking = Booking.new
  end

  def create
    @dragon = Dragon.find(params[:dragon_id])
    @booking = Booking.new(booking_params)
    @booking.dragon = @dragon
    @booking.user = current_user
    @booking.status = "Pending"
    duration = ((DateTime.parse(booking_params[:end_date]).to_date - DateTime.parse(booking_params[:start_date]).to_date).to_i) + 1
    @booking.duration = duration
    @booking.total_price = (@dragon.price_per_day * duration)
    if @booking.save
      flash[:notice] = "Booking successfully created"
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    flash[:notice] = "Booking #00#{@booking.id} successful canceled"
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
