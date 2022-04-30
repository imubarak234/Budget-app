class Log < ApplicationRecord
  belongs_to :record
  belongs_to :group

  validates :record_id, presence: true
  validates :group_id, presence: true
end
