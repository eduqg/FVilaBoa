class AddCategoriaIdToArtigos < ActiveRecord::Migration
  def change
    add_column :artigos, :categoria_id, :integer
  end
end
