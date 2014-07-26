class CreateVitrines < ActiveRecord::Migration
  def change
    create_table :vitrines do |t|
      t.string :nome
      t.attachment :imagem

      t.timestamps
    end
  end
end
