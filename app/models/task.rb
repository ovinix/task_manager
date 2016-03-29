class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  default_scope -> { order(created_at: :desc) }

  validates :user, presence: true
  validates :list, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  attr_reader :deadline_at

  # Overriding default accessor to show local time in views
  def deadline_at
    super.localtime unless super.blank?
  end

  def completed?
    !completed_at.blank?
  end

  def has_deadline?
    !deadline_at.blank?
  end

  def failed_deadline?
    if has_deadline?
      deadline_at < Time.zone.now
    end
  end
end