class Track < ActiveRecord::Base
  validates :album_id, :name, :status, presence: true
  validates :status, inclusion: { in: ["bonus", "regular"]}

  belongs_to :album
  has_one :band, through: :album
end
