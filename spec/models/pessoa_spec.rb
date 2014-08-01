require 'rails_helper'
require "paperclip/matchers"

RSpec.describe Pessoa, :type => :model do
  it "pessoa deve ter nome" do
    should validate_presence_of :nome
    should allow_value("Lucas Cardoso de Araujo", "Marlon Henrique Scalabrin", "Jônatas Davi Paganini", "José Luiz Tafarel", "Lucas Rafagnin", "Mitrut", "Jack").for(:nome)
    should_not allow_value("Podemos ver que foi gerada uma nova exceção dentro do bloco do rescue e apesar do comando final com a mensagem Fim de programa não ter sido impressa pois a exceção jogou o fluxo de processamento para fora, o bloco do ensure foi executado.Se por acaso desejarmos tentar executar o bloco que deu problema novamente, podemos utiliza", "Também podemos utilizar catch e throw para terminar o processamento quando nada mais é necessário, indicando através de um Symbol para onde o controle do código deve ser transferido        (opcionalmente com um valor), indicado com catch, usando throw").for(:nome)
    should_not allow_value("P"*256, "a"*258).for(:nome)
  end
  it "pessoa deve ter biografia" do
    should validate_presence_of :biografia
  end
  it "pessoa deve ter url" do
    should validate_presence_of :url_unica
    should validate_uniqueness_of :url_unica
    should_not allow_value("http://tambo_moveis/eliege", "http://tambo/lucas", "http://tambo_moveis/marlon_scalabrin", "http://tambo_moveis/jonataDp", "jonatas paganini", "lucas@rafagnin", "1234").for(:url_unica)
    should allow_value("abacaxi", "eu_sou_o_maximo", "homem-de-ferro", "superman123", "ap3r1t1v0").for(:url_unica)
  end
  it "pessoa deve ter email" do
    should validate_presence_of :email
    should allow_value("dev@invent.to","lucas@invent.to", "lucas.ca.de.araujo@gmail.com", "marlonscalabrin@yahoo.com.br").for(:email)
    should_not allow_value("invent.to","lucas@invent","1-lucas@invent.to", "lucas.ca.de.araujo@", "http://marlonscalabrin@yahoo.com.br").for(:email)
  end
  it "pessoa deve estar relacionada com cidade" do
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
