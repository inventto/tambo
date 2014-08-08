# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cidade do
    nome "Francisco Beltrão"
    association Factory(:estado)
  end
end
