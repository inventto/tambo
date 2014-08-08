# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :produto do
    nome "Mesa"
    descricao "Mesa mf"
    descricao_artista "yeah mesa mr branco"
    url_unica "blue_mesa_#{Time.now.to_i}"
    preco 10
    preco_promocional 9
    dimensoes "1x1x1"
    peso 1.5
    quantidade_estoque 1
    artista FactoryGirl.create(:pessoa)
    fabrica nil
  end
end
