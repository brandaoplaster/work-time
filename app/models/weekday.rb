class Weekday < ApplicationRecord
    belongs_to :user
    has_many :record_times, dependent: :destroy
    validates_presence_of :current_day
    validates_uniqueness_of :current_day, scope: :user_id

    scope :today, -> { where(current_day: Date.current) }
    validates_uniqueness_of :current_day, scope: :user_id
end
