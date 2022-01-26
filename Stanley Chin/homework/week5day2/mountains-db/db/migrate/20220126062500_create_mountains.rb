class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|

      t.string    :name
      t.string    :location #where it is
      t.text      :image_url
      t.integer   :height #closest meter
      t.integer   :deaths #deaths on mountain
      t.integer   :climbed #how many people climbed it



    end #ceate_table
  end #@change
end #class CreatePlanets
