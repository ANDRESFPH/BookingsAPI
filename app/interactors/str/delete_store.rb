class Str::DeleteStore
  include Interactor

  def call
    (store && delete_store) || fail_attempt
  end

  private

  def delete_store
    return true if store.destroy && store.destroyed?
  end

  def fail_attempt
    context.fail!(error: "Store cannot be deleted. ID #{store_id} not found")
  end

  def store
    @store ||= ::Store.find_by(id: store_id)
  end

  def store_id
    context.store_id
  end
end
