class CreateFactorWeights < ActiveRecord::Migration
  def change
    create_table :factor_weights do |t|
      t.float :chloroform_weight
      t.float :bromoform_weight
      t.float :bromodichloromethane_weight
      t.float :dibromichloromethane_weight

      t.timestamps
    end
  end
end
