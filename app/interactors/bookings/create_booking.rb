class Bookings::CreateBooking
  include Interactor

  def call
    (booking && create_booking) || fail_attempt
  end  

  private 

  def create_booking
    @booking ||= ::Booking.new(booking_params)

    if @booking.save
      context.booking = @booking
      return true
    end
  end

  def booking_errors
    @booking.errors.full_messages.to_sentence
  end

  def fail_attempt
    context.fail!(error: "Space cannot be created. #{booking_errors}")
  end


  def space
    @space ||= ::Space.find_by(id: space_id)
  end

  def organization
    @organization ||= ::Organization.find_by(id: space_id)
  end

  def space_id
    context.space_id
  end

  def organization_id
    context.organization_id
  end

  def booking_params
    {
      start_date: context.start_date,
      end_date: context.end_date,
      price: context.price,
      space_id: space_id,
      organization_id: organization_id
    }
  end
end
