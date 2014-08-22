class Imagem < ActiveRecord::Base
  belongs_to :produto
   has_attached_file :anexo, DEFAULT_OPTS_FOR_PAPPER_CLIP

   validates_attachment_content_type :anexo, :content_type => /\Aimage\/.*\Z/
   validates_attachment :anexo, size: { less_than: 5.megabytes }
end
