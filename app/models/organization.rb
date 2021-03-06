class Organization < ActiveRecord::Base
  resourcify
  validates :name, presence: true
  has_many :teams
  has_many :survey_templates
  has_many :surveys, through: :survey_templates
end
