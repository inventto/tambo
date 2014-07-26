# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :categorium, :class => 'Categoria' do
    nome "MyString"
    imagem ""
    categoria nil
  end
end
