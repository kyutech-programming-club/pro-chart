class Record < ApplicationRecord
  belongs_to :user
  has_many :record_elems
  accepts_nested_attributes_for :record_elems
end