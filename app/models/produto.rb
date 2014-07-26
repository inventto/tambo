class Produto < ActiveRecord::Base
  belongs_to :artista
  belongs_to :fabrica
end
