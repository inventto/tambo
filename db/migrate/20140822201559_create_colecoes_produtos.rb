class CreateColecoesProdutos < ActiveRecord::Migration
  def change
    create_table :colecoes_produtos do |t|
      t.references :colecao, index: true
      t.references :produto, index: true

      t.timestamps
    end
  end
end
