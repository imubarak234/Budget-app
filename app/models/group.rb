class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :logs, foreign_key: 'group_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }

  def self.totals(data)
    logs = Log.where(group_id: data).order(created_at: :desc).pluck(:record_id)
    var = 0
    logs.each do |n|
      record = Record.find(n)
      var += record.amount
    end
    var = var.round(2)
  end
end
