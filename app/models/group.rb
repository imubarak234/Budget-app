class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :logs, foreign_key: 'group_id'

  validates :name, presence: true, length: {minimum:3, maximum:100}
end
