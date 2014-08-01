# encoding: utf-8
class Pessoa < ActiveRecord::Base

   has_attached_file :foto_perfil, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
   has_attached_file :foto_capa, :styles => { :medium => "500x830>", :thumb => "50x83>" }, :default_url => "/images/:style/missing.png"

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

   belongs_to :cidade
   def to_s
     "#{nome} (#{url_unica})"
   end
end
