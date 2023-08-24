class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def index
    @bookings = Booking.all
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def my_bookings_owner
    # @bookings = Booking.joins(:dragon).where(dragons.user: current_user)
    @bookings = Booking.joins(:dragon).where(dragons: { user: current_user })
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
