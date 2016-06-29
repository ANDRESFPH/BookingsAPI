class Addr::UpdateAddress
  include Interactor

 def call
    (address && update_address) || fail_attempt
  end  

  private 

  def update_address
    return true if address.update(address_params)
  end

  def address_errors
    address.try(:errors).try(:full_messages).try(:to_sentence)
  end

  def fail_attempt
    context.fail!(error: "Address cannot be updated. #{address_errors}")
  end

  def address
    @address ||= ::Address.find_by(id: address_id)
  end

  def address_id
    context.address_id
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
