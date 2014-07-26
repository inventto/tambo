class CreateFabricaProdutos < ActiveRecord::Migration
  def change
    create_table :fabrica_produtos do |t|
      t.references :fabrica, index: true
      t.references :produto, index: true
      t.decimal :preco
      t.integer :prazo_producao_em_dias

      t.timestamps
    end
  end
end
