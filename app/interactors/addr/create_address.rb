class Addr::CreateAddress
  include Interactor

  def call
    create_address || fail_attempt
  end  

  private 

  def create_address 
    @address ||= ::Address.new(address_params)

    if @address.save
      context.address = @address
      return true
    end
  end

  def address_errors
    @address.errors.full_messages.to_sentence
  end

  def fail_attempt
    context.fail!(error: "Address cannot be created. #{address_errors}")
  end

  def address_params
    {
      street: context.street,
      zip: context.zip,
      city: context.city,
      country: context.country
    }
  end
end
