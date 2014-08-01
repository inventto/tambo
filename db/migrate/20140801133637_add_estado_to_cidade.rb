class AddEstadoToCidade < ActiveRecord::Migration
  	def down
  	  add_column :cidades, :estado, :string
      remove_reference :cidades, :estado, index: true
	end

	def up
	  remove_column :cidades, :estado, :string
      add_reference :cidades, :estado, index: true
    
  	end
end
