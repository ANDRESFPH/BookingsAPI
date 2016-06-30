class Spaces::GetSpaces
  include Interactor

 def call
    context.spaces = ::Space.all
  end
end
