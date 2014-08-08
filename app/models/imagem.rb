class Imagem < ActiveRecord::Base
  belongs_to :produto
   has_attached_file :anexo, :styles => {:default => "500x500", :medium => "300x300", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

   validates_attachment_content_type :anexo, :content_type => /\Aimage\/.*\Z/
   validates_attachment :anexo, size: { less_than: 5.megabytes }
end
