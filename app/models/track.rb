class Track < ActiveRecord::Base
  validates :track_id, :name, :status, presence: true
  validates :status, inclusion: { in: ["bonus", "regular"]}
end
