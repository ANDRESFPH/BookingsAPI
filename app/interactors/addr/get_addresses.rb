class Addr::GetAddresses
  include Interactor

  def call
    context.addresses = ::Address.all
  end
end
