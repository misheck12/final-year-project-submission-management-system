class Team < ApplicationRecord
  # Team associations
  has_many :users, dependent: :destroy
  belongs_to :tasks

  # Team validations
  validates :name, presence: true
end