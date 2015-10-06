class Map < ActiveRecord::Base

  # Validations
  validates :name, presence: true, uniqueness: true

end
