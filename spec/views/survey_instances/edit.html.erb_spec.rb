require 'rails_helper'

RSpec.describe "survey_instances/edit", type: :view do
  let(:survey) { create(:survey) }
  let(:survey_instance) { create(:survey_instance, survey: survey) }

  before(:each) do
    assign(:survey, survey)
    assign(:survey_instance, survey_instance)
    assign(:record, survey_instance)
  end

  it "renders the edit survey_instance form" do
    render

    assert_select "form[action=?][method=?]", survey_instance_path(survey_instance), "post" do

      assert_select "input#survey_instance_name[name=?]", "survey_instance[name]"
    end
  end
end