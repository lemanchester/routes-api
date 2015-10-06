class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.float :distance
      t.references :map, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
