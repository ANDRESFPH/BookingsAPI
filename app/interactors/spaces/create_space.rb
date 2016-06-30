class Spaces::CreateSpace
  include Interactor

  def call
    (store && create_space) || fail_attempt
  end  

  private 

  def create_space
    @space ||= ::Space.new(space_params)

    if @space.save
      context.space = @space
      return true
    end
  end

  def space_errors
    @space.errors.full_messages.to_sentence
  end

  def fail_attempt
    context.fail!(error: "Space cannot be created. #{space_errors}")
  end


  def store
    @store ||= ::Store.find_by(id: store_id)
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
      store_id: store_id,  
      size: context.size
    }
  end
end
