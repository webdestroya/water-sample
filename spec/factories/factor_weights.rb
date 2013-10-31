# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :factor_weight do
    id                          1
    chloroform_weight           0.8
    bromoform_weight            1.2
    bromodichloromethane_weight 1.5
    dibromichloromethane_weight 0.7
  end
end
