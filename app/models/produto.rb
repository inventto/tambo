class Produto < ActiveRecord::Base
  belongs_to :artista, class_name: 'Pessoa', foreign_key: "artista_id"
  belongs_to :fabrica, class_name: 'Pessoa', foreign_key: "fabrica_id"
  validates :nome, presence: true
  validates :url_unica, presence: true, uniqueness: true, format: { with: /\A[a-z0-9_\-]+\z/ }
  validates :preco, presence: true, numericality: true
  validates :preco_promocional, presence: true, numericality: true
  validate :preco_promocional_menor_que_preco
  validates :peso, presence: true, numericality: true
  validates :quantidade_estoque, presence: true, numericality: true

  def preco_promocional_menor_que_preco
    if preco and preco_promocional and preco > preco_promocional
      self.errors.add(:preco_promocional, "O preço promocional deve ser menor que o preço")
    end
  end

  def to_s
    "#{nome} (#{url_unica})"
  end
end
