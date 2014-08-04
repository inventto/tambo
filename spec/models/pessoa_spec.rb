require 'rails_helper'
require "paperclip/matchers"

RSpec.describe Pessoa, :type => :model do
  it "pessoa deve ter nome" do
    should validate_presence_of :nome
  end
  it "pessoa deve ter biografia" do
    should validate_presence_of :biografia
  end
  it "pessoa deve ter url" do
    should validate_presence_of :url_unica
  end
  it "pessoa deve ter email" do
    should validate_presence_of :email
  end
  it "pessoa deve estar realcionada com cidade" do
    should belong_to :cidade
    #should validate_presence_of :cidade
  end
  it "pessoa deve ter imagem" do
    have_attached_file(:foto_perfil)
    have_attached_file(:foto_capa)
    should validate_attachment_content_type(:foto_perfil). allowing('image/png', 'image/gif'). rejecting('text/plain', 'text/xml')
    should validate_attachment_content_type(:foto_capa). allowing('image/png', 'image/gif'). rejecting('text/plain', 'text/xml')
    should validate_attachment_size(:foto_perfil). less_than(2.megabytes)
    should validate_attachment_size(:foto_capa). less_than(2.megabytes)
  end
end
