class Str::GetStores
  include Interactor

  def call
    context.stores = ::Store.all
  end
end
