class InsertCidades < ActiveRecord::Migration

  def up
  	  Estado.destroy_all 
      Cidade.destroy_all

     File.readlines(Rails.root.join('db','insert_estados_cidades.sql')).each do |sql|
       	execute sql
  	 end
  end
  def down
  end
end
