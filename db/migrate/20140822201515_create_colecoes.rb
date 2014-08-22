class CreateColecoes < ActiveRecord::Migration
  def change
    create_table :colecoes do |t|
      t.string :nome
      t.attachment :imagem

      t.timestamps
    end
  end
end
