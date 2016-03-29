class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  default_scope -> { order(created_at: :desc) }

  validates :user, presence: true
  validates :list, presence: true
  validates :content, presence: true

  def completed?
    !completed_at.blank?
  end
end