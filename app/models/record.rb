class Record < ApplicationRecord
  belongs_to :user
  has_many :record_elems

  validates :r_date, presence: true
end