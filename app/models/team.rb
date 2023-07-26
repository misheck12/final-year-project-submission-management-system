class Team < ApplicationRecord
  # Team associations
  has_many :users, dependent: :destroy
  has_many :tasks

  # Team validations
  validates :name, presence: true
end