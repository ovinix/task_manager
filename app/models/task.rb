class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  default_scope -> { order(created_at: :desc) }

  validates :user, presence: true
  validates :project, presence: true
  validates :content, presence: true

  def completed?
    !completed_at.blank?
  end
end