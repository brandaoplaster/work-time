class RecordTime < ApplicationRecord
  belongs_to :weekday

  validates_presence_of :time_stamp
end
