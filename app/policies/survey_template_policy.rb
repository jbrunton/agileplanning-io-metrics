# Authorization policy for {SurveyTemplate}.
class SurveyTemplatePolicy < OrganizationResourcePolicy
  def initialize(user, survey_template)
    super OrganizationPolicy.new(user, survey_template.organization)
  end

  def trends?
    show?
  end

  def show_surveys?
    show?
  end

end
