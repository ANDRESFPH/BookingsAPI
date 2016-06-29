class Org::CreateOrganization
  include Interactor

  def call
    create_organization || fail_attempt
  end  

  private 

  def create_organization 
    @organization ||= ::Organization.new(organization_params)

    if @organization.save
      context.organization = @organization
      return true
    end
  end

  def organization_errors
    @organization.errors.full_messages.to_sentence
  end

  def fail_attempt
    context.fail!(error: "Organization cannot be created. #{organization_errors}")
  end

  def organization_params
    {
      title: context.title,
      description: context.description,
      org_type: context.org_type
    }
  end
end
