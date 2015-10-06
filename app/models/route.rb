class Route < ActiveRecord::Base

  # Associations
  belongs_to :map

  # Validations
  validates :origin, :destination, :distance, :map, presence: true
  validates :distance, numericality: true


end
