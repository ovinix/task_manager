class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  if Rails.env.production?
    default_scope -> { order(completed_at: :desc, priority: :desc, created_at: :desc ) }
  else
    default_scope -> { order(:completed_at, priority: :desc, created_at: :desc ) }
  end  

  validates :user, presence: true
  validates :list, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  attr_reader :deadline_at

  enum priority: [:normal, :important]

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