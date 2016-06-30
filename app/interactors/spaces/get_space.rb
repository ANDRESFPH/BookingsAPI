class Spaces::GetSpace
  include Interactor

 def call
    get_space || fail_attempt
  end

  private 

  def get_space 
    space = ::Space.find_by(id: space_id)
      
    if space.present?
      context.space = space
      return true
    end
  end

  def fail_attempt
    context.fail!(message: 'Space not found')
  end

  def space_id
    context.space_id
  end
end
