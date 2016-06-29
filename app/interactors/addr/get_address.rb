class Addr::GetAddress
  include Interactor

  def call
    get_address || fail_attempt
  end

  private 

  def get_address 
    address = ::Address.find_by(id: address_id)
      
    if address.present?
      context.address = address
      return true
    end
  end

  def fail_attempt
    context.fail!(message: 'Address not found')
  end

  def address_id
    context.address_id
  end
end
