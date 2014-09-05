class Categoria < ActiveRecord::Base
  belongs_to :categoria
  has_and_belongs_to_many :produtos, join_table: :categorias_produtos
  has_and_belongs_to_many :vitrines

  has_attached_file :imagem, DEFAULT_OPTS_FOR_PAPPER_CLIP
  validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/

  validates :nome, uniqueness: true, presence: true

  validate :nao_permite_categoria_igual
  
  def nao_permite_categoria_igual
    if categoria && categoria == self
      self.errors.add(:categoria, "Uma categoria não pode ser filha dela mesma :(")
    end
  end

  def to_s
    nome
  end

end
