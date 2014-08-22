class ArtistaProduto < ActiveRecord::Base
  belongs_to :artista, class_name: "Pessoa"
  belongs_to :produto
  validates_uniqueness_of :produto
end
