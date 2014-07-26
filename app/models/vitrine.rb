class Vitrine < ActiveRecord::Base
  validates :nome, presence: true
  has_and_belongs_to_many :categorias

  has_attached_file :imagem
  validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/

  def to_s
    nome
  end
end
