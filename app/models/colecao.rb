class Colecao < ActiveRecord::Base
  has_and_belongs_to_many :produtos

  has_attached_file :imagem, DEFAULT_OPTS_FOR_PAPPER_CLIP
  validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/

  validates :nome, uniqueness: true, presence: true

end
