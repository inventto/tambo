class FabricaProduto < ActiveRecord::Base
  belongs_to :fabrica
  belongs_to :produto
end
