class CreateTiles < ActiveRecord::Migration[6.1]
  def change
    create_table :tiles do |t|
      t.string :x_axis
      t.string :y_axis
      t.string :value, default: nil
      t.boolean :revealed, default: false
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
