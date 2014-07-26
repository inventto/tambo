class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.text :biografia
      t.date :iniciou_em
      t.string :url_unica
      t.text :cidade
      t.attachment :foto_perfil
      t.attachment :foto_capa

      t.timestamps
    end
  end
end
