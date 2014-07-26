class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nome, null: false
      t.attachment :imagem
      t.references :categoria, index: true

      t.timestamps
    end
  end
end
