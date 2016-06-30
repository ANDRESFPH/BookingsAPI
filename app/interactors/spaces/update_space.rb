class Spaces::UpdateSpace
  include Interactor

 def call
    (space && store && update_space) || fail_attempt
  end  

  private 

  def update_space
    return true if space.update(space_params)
  end

  def space_errors
    space.try(:errors).try(:full_messages).try(:to_sentence)
  end

  def fail_attempt
    context.fail!(error: "Store cannot be updated. #{space_errors}")
  end

  def store
    @store ||= ::Store.find_by(id: store_id)
  end

  def space
    @space ||= ::Space.find_by(id: space_id)
  end

  def space_id
    context.space_id
  end

   def store_id
    context.store_id
  end
    
  def space_params
    {
      title: context.title,
      price_per_day: context.price_per_day,
      price_per_week: context.price_per_week,
      price_per_month: context.price_per_month,
      store_id: store_id
    }
  end
end
