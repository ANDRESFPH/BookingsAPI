class Spaces::DeleteSpace
  include Interactor

  def call
    (space && delete_space) || fail_attempt
  end

  private

  def delete_space
    return true if space.destroy && space.destroyed?
  end

  def fail_attempt
    context.fail!(error: "Space cannot be deleted. ID #{space_id} not found")
  end

  def space
    @space ||= ::Space.find_by(id: space_id)
  end

  def store_id
    context.space_id
  end
end
