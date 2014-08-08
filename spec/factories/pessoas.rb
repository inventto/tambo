# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pessoa do
    nome "Jônatas Davi Paganini"
    email "jonatasdp@gmail.com"
    biografia "Nerds life"
    iniciou_em "2014-07-25"
    url_unica "jonatasdp_#{Time.now.to_i}"
    #cidade FactoryGirl.create(:cidade)
    foto_perfil File.new(Rails.root.join("spec/fixtures/jonatasdp.png"))
    foto_capa ""
  end
end
