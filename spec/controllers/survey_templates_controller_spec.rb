require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SurveyTemplatesController, type: :controller do
  include_context 'authenticated'

  # This should return the minimal set of attributes required to create a valid
  # Survey. As you add validations to Survey, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:survey_template)
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SurveysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:organization) { create(:organization) }
  let!(:survey_template) { create(:survey_template, organization: organization) }

  before(:each) do
    current_user.add_role :admin, organization
  end

  describe "GET #index" do
    it "assigns all surveys as @surveys" do
      get :index, {organization_id: organization.to_param}, valid_session
      expect(assigns(:survey_templates)).to eq([survey_template])
    end
  end

  describe "GET #show" do
    it "assigns the requested survey as @survey" do
      get :show, {:id => survey_template.to_param}, valid_session
      expect(assigns(:survey_template)).to eq(survey_template)
    end
  end

  describe "GET #new" do
    it "assigns a new survey as @survey" do
      get :new, {organization_id: organization.to_param}, valid_session
      expect(assigns(:survey_template)).to be_a_new(SurveyTemplate)
    end
  end

  describe "GET #edit" do
    it "assigns the requested survey as @survey" do
      get :edit, {:id => survey_template.to_param}, valid_session
      expect(assigns(:survey_template)).to eq(survey_template)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Survey" do
        expect {
          post :create, {organization_id: organization.to_param, :survey_template => valid_attributes}, valid_session
        }.to change(SurveyTemplate, :count).by(1)
      end

      it "assigns a newly created survey as @survey" do
        post :create, {organization_id: organization.to_param, :survey_template => valid_attributes}, valid_session
        expect(assigns(:survey_template)).to be_a(SurveyTemplate)
        expect(assigns(:survey_template)).to be_persisted
      end

      it "redirects to the created survey" do
        post :create, {organization_id: organization.to_param, :survey_template => valid_attributes}, valid_session
        expect(response).to redirect_to(SurveyTemplate.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved survey as @survey" do
        post :create, {organization_id: organization.to_param, :survey_template => invalid_attributes}, valid_session
        expect(assigns(:survey_template)).to be_a_new(SurveyTemplate)
      end

      it "re-renders the 'new' template" do
        post :create, {organization_id: organization.to_param, :survey_template => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:survey_template)
      }

      it "updates the requested survey" do
        put :update, {:id => survey_template.to_param, :survey_template => new_attributes}, valid_session

        survey_template.reload
        expect(survey_template.name).to eq(new_attributes[:name])
      end

      it "assigns the requested survey as @survey" do
        put :update, {:id => survey_template.to_param, :survey_template => valid_attributes}, valid_session
        expect(assigns(:survey_template)).to eq(survey_template)
      end

      it "redirects to the survey" do
        put :update, {:id => survey_template.to_param, :survey_template => valid_attributes}, valid_session
        expect(response).to redirect_to(survey_template)
      end
    end

    context "with invalid params" do
      it "assigns the survey as @survey" do
        put :update, {:id => survey_template.to_param, :survey_template => invalid_attributes}, valid_session
        expect(assigns(:survey_template)).to eq(survey_template)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => survey_template.to_param, :survey_template => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested survey" do
      expect {
        delete :destroy, {:id => survey_template.to_param}, valid_session
      }.to change(SurveyTemplate, :count).by(-1)
    end

    it "redirects to the surveys list" do
      delete :destroy, {:id => survey_template.to_param}, valid_session
      expect(response).to redirect_to(organization_survey_templates_url(organization))
    end
  end

end
