class TodoItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user, presence: true
  validates :project, presence: true
  validates :content, presence: true
end
