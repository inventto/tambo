class AddCategoriaToProdutos < ActiveRecord::Migration
  def change
    add_reference :produtos, :categoria, index: true
  end
end
