class Org::UpdateOrganization
  include Interactor

  def call
    (organization && update_organization) || fail_attempt
  end  

  private 

  def update_organization
    return true if organization.update(organization_params)
  end

  def organization_errors
    organization.try(:errors).try(:full_messages).try(:to_sentence)
  end

  def fail_attempt
    context.fail!(error: "Organization cannot be updated. #{organization_errors}")
  end

  def organization
    @organization ||= ::Organization.find_by(id: organization_id)
  end

  def organization_id
    context.organization_id
  end
    
  def organization_params
    {
      title: context.title,
      description: context.description,
      org_type: context.org_type
    }
  end
end
