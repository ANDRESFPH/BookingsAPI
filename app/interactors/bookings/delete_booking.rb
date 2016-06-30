class Bookings::DeleteBooking
  include Interactor

  def call
    (booking && delete_booking) || fail_attempt
  end

  private

  def delete_booking
    return true if booking.destroy && booking.destroyed?
  end

  def fail_attempt
    context.fail!(error: "Booking cannot be deleted. ID #{booking_id} not found")
  end

  def booking
    @booking ||= ::Booking.find_by(id: booking_id)
  end

  def booking_id
    context.booking_id
  end
end
