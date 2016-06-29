class Addr::DeleteAddress
  include Interactor

 def call
    (address && delete_address) || fail_attempt
  end

  private

  def delete_address
    return true if address.destroy && address.destroyed?
  end

  def fail_attempt
    context.fail!(error: "Address cannot be deleted. ID #{address_id} not found")
  end

  def address
    @address ||= ::Address.find_by(id: address_id)
  end

  def address_id
    context.address_id
  end

end
