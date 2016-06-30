class Bookings::GetBooking
  include Interactor

  def call
    get_booking || fail_attempt
  end

  private 

  def get_booking 
    booking = ::Booking.find_by(id: booking_id)
      
    if booking.present?
      context.booking = booking
      return true
    end
  end

  def fail_attempt
    context.fail!(message: 'Booking not found')
  end

  def booking_id
    context.booking_id
  end

end
