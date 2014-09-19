# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pessoa do
    nome "Jônatas Davi Paganini"
    email "jonatasdp@gmail.com"
    biografia "Nerds life"
    iniciou_em "2014-07-25"
    url_unica "jonatasdp"
    cidade
    foto_perfil File.new(Rails.root.join("spec/fixtures/jonatasdp.png"))
    foto_capa ""
  end
  factory :pessoa_juridica do
    nome "Tambo Móveis Artesanais"
    email "contato@galeriatambo.com.br"
    biografia "A tambo é uma empresa do ramo de móveis com dedicação artesanal."
    iniciou_em "2009-02-25"
    url_unica "tambo"
    cidade
    foto_perfil File.new(Rails.root.join("spec/fixtures/jonatasdp.png"))
    foto_capa ""
  end
end
