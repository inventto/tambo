# encoding: utf-8
class Pessoa < ActiveRecord::Base

   has_attached_file :foto_perfil, DEFAULT_OPTS_FOR_PAPPER_CLIP
   has_attached_file :foto_capa, DEFAULT_OPTS_FOR_PAPPER_CLIP

   [:foto_perfil, :foto_capa].each do |atributo|
     validates_attachment_content_type atributo, :content_type => /\Aimage\/.*\Z/
     validates_attachment atributo, size: { less_than: 2.megabytes }
   end

   validates :nome, :biografia, presence: true
   validates_size_of :nome, maximum: 255
   validates :url_unica, presence: true, uniqueness: true
   validates_format_of :url_unica, with: /\A([A-Z][A-Z0-9_\-]{3,})\Z/i
   validates :email, presence: true, email: true
   validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
   validates_associated :cidade
   validates :cidade_id, presence: true

   belongs_to :cidade
   has_many :produtos_artista, join_table: "artista_produtos", class_name: "ArtistaProduto", foreign_key: "artista_id"
   has_many :produtos_fabrica, join_table: "fabrica_produtos", class_name: "FabricaProduto", foreign_key: "fabrica_id"
   has_many :produtos, through: :produtos_artista
   validates :produtos_fabrica, :produtos_artista, associated: true

   def to_s
     "#{nome} (#{url_unica})"
   end
end
