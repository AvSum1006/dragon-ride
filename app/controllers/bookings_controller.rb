class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  before_action :set_dragon, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dragon = @dragon
    @booking.user = current_user
    @booking.status = "Pending"
    duration = ((DateTime.parse(booking_params[:end_date]).to_date - DateTime.parse(booking_params[:start_date]).to_date).to_i) + 1
    @booking.duration = duration
    @booking.total_price = (@dragon.price_per_day * duration)
    if @booking.save
      flash[:notice] = "Booking ##{@booking.id.to_s.rjust(4, '0')} successfully created"
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    flash[:notice] = "Booking ##{@booking.id.to_s.rjust(4, '0')} successfully canceled"
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_dragon
    @dragon = Dragon.find(params[:dragon_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
