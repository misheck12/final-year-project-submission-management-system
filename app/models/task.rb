class Task < ApplicationRecord
  belongs_to :project
  belongs_to :team

  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  def name
    self.title
  end
end
