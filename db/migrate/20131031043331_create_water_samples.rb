class CreateWaterSamples < ActiveRecord::Migration
  def change
    create_table :water_samples do |t|
      t.string :site
      t.float :chloroform
      t.float :bromoform
      t.float :bromodichloromethane
      t.float :dibromichloromethane

      t.timestamps
    end
  end
end
