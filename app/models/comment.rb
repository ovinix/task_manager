class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  has_one :list, through: :task

  validates :content, presence: true, length: { maximum: 140 }

end
