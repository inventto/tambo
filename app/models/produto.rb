class Produto < ActiveRecord::Base
  belongs_to :artista, class_name: 'Pessoa', foreign_key: "artista_id"
  belongs_to :fabrica, class_name: 'Pessoa', foreign_key: "fabrica_id"

 def to_s
   "#{nome} (#{url_unica})"
 end
end
