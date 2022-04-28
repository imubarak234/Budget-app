class Record < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :logs, foreign_key: 'record_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
