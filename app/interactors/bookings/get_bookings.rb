class Bookings::GetBookings
  include Interactor

 def call
    context.bookings = ::Booking.all
 end
end
