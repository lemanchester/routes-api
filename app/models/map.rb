class Map < ActiveRecord::Base

  # Associations
  has_many :routes, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true


  def route_points
    routes.map(&:origin) + routes.map(&:destination)
  end

end
