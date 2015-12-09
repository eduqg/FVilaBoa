class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :Nome

      t.timestamps null: false
    end
  end
end
