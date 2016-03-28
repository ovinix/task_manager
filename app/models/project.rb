class Project < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  
  validates :user, presence: true
  validates :title, presence: true
end
