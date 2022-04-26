class User < ApplicationRecord
  has_many :groups, foreign_key: 'author_id'
  has_many :records, foreign_key: 'author_id'

  validates :name, presence: true
end
