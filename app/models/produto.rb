class Produto < ActiveRecord::Base
  belongs_to :artista, class_name: 'Pessoa', foreign_key: "artista_id"
  belongs_to :fabrica, class_name: 'Pessoa', foreign_key: "fabrica_id"
  has_and_belongs_to_many :categorias, join_table: :categorias_produtos
  has_many :imagens

  validates :nome, presence: true
  validates :url_unica, presence: true, uniqueness: true, format: { with: /\A[a-z0-9_\-]+\z/ }
  validates :preco, presence: true, numericality: true
  validates :preco_promocional, presence: true, numericality: true
  validate :preco_promocional_menor_que_preco
  validates :peso, presence: true, numericality: true
  validates :quantidade_estoque, presence: true, numericality: true

  def preco_promocional_menor_que_preco
    if preco and preco_promocional and preco < preco_promocional
      self.errors.add(:preco_promocional, "deve ser menor que o preço")
    end
  end
  def to_s
    "#{nome} (#{url_unica})"
  end
  def do_artista
    artista.produtos_artista.where(produto_id: self.id).first
  end
  def da_fabrica
    fabrica.produtos_fabrica.where(produto_id: self.id).first
  end
  def preco_artista
    do_artista.preco
  end
  def preco_fabrica
    da_fabrica.preco
  end

  def parcelado_em ate_n_vezes
    parcelas = []
    ate_n_vezes.times do |i|
      parcela = i + 1
      preco_parcela = preco.reais.parcelar(parcela).first
      parcelas << [  "#{parcela} parcelas de R$ #{preco_parcela}", parcela]
    end
    parcelas
  end
  def comissao_site
    preco - preco_artista - preco_fabrica
  end
end
