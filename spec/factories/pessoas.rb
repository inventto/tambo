# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pessoa do
    nome "MyString"
    biografia "MyText"
    iniciou_em "2014-07-25"
    url_unica "MyString"
    cidade "MyText"
    foto_perfil ""
    foto_capa ""
  end
end
