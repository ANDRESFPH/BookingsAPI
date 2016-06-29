class Str::GetStore
  include Interactor

  def call
    get_store || fail_attempt
  end

  private 

  def get_store 
    store = ::Store.find_by(id: store_id)
      
    if store.present?
      context.store = store
      return true
    end
  end

  def fail_attempt
    context.fail!(message: 'Store not found')
  end

  def store_id
    context.store_id
  end
end
