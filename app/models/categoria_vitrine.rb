class CategoriaVitrine < ActiveRecord::Base
  belongs_to :categoria
  belongs_to :vitrine
end
