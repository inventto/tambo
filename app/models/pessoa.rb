# encoding: utf-8
class Pessoa < ActiveRecord::Base

   has_attached_file :foto_perfil, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
   has_attached_file :foto_capa, :styles => { :medium => "500x830>", :thumb => "50x83>" }, :default_url => "/images/:style/missing.png"

   [:foto_perfil, :foto_capa].each do |atributo|
     validates_attachment_content_type atributo, :content_type => /\Aimage\/.*\Z/
   end

   validates :nome, presence: true
   validates :biografia, presence: true
   validates :url_unica, presence: true, uniqueness: true
   validates :email, presence: true, email: true
   validates_associated :cidade

   belongs_to :cidade
   def to_s
     "#{nome} (#{url_unica})"
   end
end
