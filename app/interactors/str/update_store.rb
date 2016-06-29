class Str::UpdateStore
  include Interactor

  def call
    (store && organization && address && update_store) || fail_attempt
  end  

  private 

  def update_store
    return true if store.update(store_params)
  end

  def store_errors
    store.try(:errors).try(:full_messages).try(:to_sentence)
  end

  def fail_attempt
    context.fail!(error: "Store cannot be updated. #{store_errors}")
  end

  def store
    @store ||= ::Store.find_by(id: store_id)
  end

  def store_id
    context.store_id
  end

  def organization_id
    context.organization_id
  end

  def address_id
    context.address_id
  end

  def organization
    if organization_id.nil?
      return true
    else
      Org::GetOrganization.call(organization_id: organization_id).success?
    end
  end

  def address
    if address_id.nil?
      return true
    else
      Addr::GetAddres.call(addres_id: address_id).success?
    end
  end
    
  def store_params
    {
      title: context.title,
      opening_hours: context.opening_hours,
      address: address_id,
      organization: organization_id
    }
  end
end
