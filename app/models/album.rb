class Album < ActiveRecord::Base
  validates :band_id, :title, :format, presence: true
  validates :format, inclusion: {in: [:studio, :live]}
end
