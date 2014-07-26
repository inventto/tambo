# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fabrica_produto do
    fabrica nil
    produto nil
    preco "9.99"
    prazo_producao_em_dias 1
  end
end
