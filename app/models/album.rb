class Album < ActiveRecord::Base
  validates :band_id, :title, :format, presence: true
  validates :format, inclusion: {in: ['studio', 'live']}

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
