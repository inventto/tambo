class ColecaoProduto < ActiveRecord::Base
  belongs_to :colecao
  belongs_to :produto
end
