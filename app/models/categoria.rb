class Categoria < ActiveRecord::Base
  belongs_to :categoria
  has_and_belongs_to_many :vitrines

  has_attached_file :imagem
  validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/

  def to_s
    nome
  end

end
