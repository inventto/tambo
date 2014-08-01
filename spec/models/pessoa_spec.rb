require 'rails_helper'
require "paperclip/matchers"

RSpec.describe Pessoa, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "pessoa deve ter nome" do
    should validate_presenca_of :nome
  end
  it "pessoa deve ter biografia" do
    should validate_presenca_of :biografia
  end
  it "pessoa deve ter url" do
    should validate_presenca_of :url
  end
  it "pessoa deve ter email" do
    should validate_presenca_of :email
  end
  it "pessoa deve estar realcionada com cidade" do
    should validate_belong_to :cidade
    slould validate_associated :cidade
  end
  it "pessoa deve ter imagem" do
    have_attached_file(:foto_perfil)
    have_attached_file(:foto_capa)
    should validate_attachment_presence(:foto_perfil)
    should validate_attachment_presence(:foto_capa)
    should validate_attachment_content_type(:foto_perfil). allowing('image/png', 'image/gif'). rejecting('text/plain', 'text/xml')
    should validate_attachment_content_type(:foto_capa). allowing('image/png', 'image/gif'). rejecting('text/plain', 'text/xml')
    should validate_attachment_size(:foto_perfil). less_than(2.megabytes)
    should validate_attachment_size(:foto_capa). less_than(2.megabytes)
  end
end
