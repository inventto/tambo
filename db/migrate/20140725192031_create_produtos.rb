class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome, null: false
      t.text :descricao
      t.text :descricao_artista
      t.string :url_unica, null: false
      t.decimal :preco
      t.decimal :preco_promocional
      t.string :dimensoes
      t.float :peso
      t.integer :quantidade_estoque
      t.references :artista, index: true
      t.references :fabrica, index: true

      t.timestamps
    end
  end
end
