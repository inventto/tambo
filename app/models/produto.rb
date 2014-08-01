class Produto < ActiveRecord::Base
  belongs_to :artista, class_name: 'Pessoa', foreign_key: "artista_id"
  belongs_to :fabrica, class_name: 'Pessoa', foreign_key: "fabrica_id"
  validates :nome, presence: true
  validates :url_unica, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/ }
  validates :preco, presence: true, numericality: true

 def to_s
   "#{nome} (#{url_unica})"
 end
end
