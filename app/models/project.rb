class Project < ApplicationRecord
  # Project associations
  has_many :users, dependent: :destroy
  has_many :teams, through: :users, foreign_key: :team_id

  # Project validations
  validates :title, presence: true
  validates :description, presence: true

  # Active Storage configuration
  has_one_attached :document
  validate :document_content_type

  private

  def document_content_type
    if document.attached? && !document.content_type.in?(%w(application/pdf))
      errors.add(:document, "must be a PDF")
    end
  end
end
