class CreateCategoriaVitrines < ActiveRecord::Migration
  def change
    create_table :categoria_vitrines do |t|
      t.references :categoria, index: true
      t.references :vitrine, index: true

      t.timestamps
    end
  end
end
