class Org::DeleteOrganization
  include Interactor

  def call
    (organization && delete_organization) || fail_attempt
  end

  private

  def delete_organization
    return true if organization.destroy && organization.destroyed?
  end

  def fail_attempt
    context.fail!(error: "Organization cannot be deleted. ID #{organization_id} not found")
  end

  def organization
    @organization ||= ::Organization.find_by(id: organization_id)
  end

  def organization_id
    context.organization_id
  end

end
