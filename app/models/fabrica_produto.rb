class FabricaProduto < ActiveRecord::Base
  belongs_to :fabrica, class_name: "Pessoa"
  belongs_to :produto
  def to_s
    "#{fabrica} -> #{produto}"
  end
end
