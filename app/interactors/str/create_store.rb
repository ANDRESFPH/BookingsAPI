class Str::CreateStore
  include Interactor

  def call
    (organization && address && create_store) || fail_attempt
  end  

  private 

  def create_store 
    @store ||= ::Store.new(store_params)

    if @store.save
      context.store = @store
      return true
    end
  end

  def store_errors
    @store.errors.full_messages.to_sentence
  end

  def fail_attempt
    context.fail!(error: "Store cannot be created. #{store_errors}")
  end

  def organization
    @organization ||= ::Organization.find_by(id: organization_id)
  end

  def address
    @address ||= ::Address.find_by(id: address_id)
  end

  def organization_id
    context.organization_id
  end

  def address_id
    context.address_id
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
