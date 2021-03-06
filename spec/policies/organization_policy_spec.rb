require 'rails_helper'

describe OrganizationPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:team) { create(:team, organization: organization) }

  permissions :show? do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, organization)
    end

    it "allows access if the user is an org admin" do
      user.add_role(:admin, organization)
      expect(subject).to permit(user, organization)
    end

    it "allows access if the user is a member" do
      user.add_role(:member, team)
      expect(subject).to permit(user, organization)
    end
  end

  permissions :update?, :destroy? do
    it "denies access if the user isn't a member" do
      expect(subject).not_to permit(user, organization)
    end

    it "denies access if the user isn't an org admin" do
      user.add_role(:member, team)
      user.add_role(:admin, team)

      expect(subject).not_to permit(user, organization)
    end

    it "grants access if the user is an org admin" do
      user.add_role(:admin, organization)
      expect(subject).to permit(user, organization)
    end
  end
end