class ArtistaProduto < ActiveRecord::Base
  belongs_to :artista
  belongs_to :produto
end
