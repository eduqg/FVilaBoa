class CreateArtigos < ActiveRecord::Migration
  def change
    create_table :artigos do |t|
      t.string :Título
      t.text :Conteúdo

      t.timestamps null: false
    end
  end
end
