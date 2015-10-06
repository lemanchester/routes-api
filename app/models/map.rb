class Map < ActiveRecord::Base

  # Associations
  has_many :routes, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true

end
