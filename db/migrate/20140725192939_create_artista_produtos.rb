class CreateArtistaProdutos < ActiveRecord::Migration
  def change
    create_table :artista_produtos do |t|
      t.references :artista, index: true
      t.references :produto, index: true
      t.decimal :preco
      t.integer :prazo_producao_em_dias

      t.timestamps
    end
  end
end
