class CreateCategoriasProdutos < ActiveRecord::Migration
  def change
    create_table :categorias_produtos, id: false do |t|
      t.references :categoria
      t.references :produto
    end
    add_index :categorias_produtos, [:categoria_id, :produto_id]
  end
end
