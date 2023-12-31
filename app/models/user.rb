class User < ApplicationRecord
  # Devise modules for user authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User associations
  belongs_to :team, optional: true
  belongs_to :project, optional: true
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id'
  has_many :projects, dependent: :destroy

  # User roles for authorization with Cancancan
  enum role: { student: 0, faculty: 1, staff: 2, admin: 3 }

  validates :name, presence: true
  validates :role, presence: true
  validates :email, uniqueness: true

  before_create :assign_admin_if_first_user

  private

  def assign_admin_if_first_user
    if User.count.zero?
      self.role = 'admin'
    end
  end
end
