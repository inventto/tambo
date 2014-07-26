class AddCidadeToPessoa < ActiveRecord::Migration
  def change
    remove_column :pessoas, :cidade
    add_reference :pessoas, :cidade, index: true
  end
end
