class RenameDescricaoArtistaToConceitoOnProdutos < ActiveRecord::Migration
  def change
    rename_column :produtos, :descricao_artista, :conceito
  end
end
