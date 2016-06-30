class Bookings::UpdateBooking
  include Interactor

  def call
    (booking && space && organization && update_booking) || fail_attempt
  end  

  private 

  def update_booking
    return true if booking.update(booking_params)
  end

  def booking_errors
    booking.try(:errors).try(:full_messages).try(:to_sentence)
  end

  def fail_attempt
    context.fail!(error: "Booking cannot be updated. #{booking_errors}")
  end

  def booking
    @booking ||= ::Booking.find_by(id: booking_id)
  end

  def space
    @space ||= ::Space.find_by(id: space_id)
  end

  def organization
    @organization ||= ::Organization.find_by(id: organization_id)
  end

  def booking_id
    context.booking_id
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
      organization_id: organization_id,
    }
  end
end
