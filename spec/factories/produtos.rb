# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :produto do
    nome "MyString"
    descricao "MyText"
    descricao_artista "MyText"
    url_unica "ring"
    preco 10
    preco_promocional 11
    dimensoes "MyString"
    peso 1.5
    quantidade_estoque 1
    artista nil
    fabrica nil
  end
end
