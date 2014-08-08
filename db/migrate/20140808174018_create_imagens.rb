class CreateImagens < ActiveRecord::Migration
  def change
    create_table :imagens do |t|
      t.references :produto, index: true
      t.attachment :anexo

      t.timestamps
    end
  end
end
