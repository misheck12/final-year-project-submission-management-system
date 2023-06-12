class Team < ApplicationRecord
  # Team associations
  has_many :users, dependent: :destroy

  # Team validations
  validates :name, presence: true
end