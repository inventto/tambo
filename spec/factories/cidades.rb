# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cidade do
    nome "Francisco Beltrão"
    estado factory: :estado, strategy: :build
  end
end
