# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :factor_weight do
    id                          1
    chloroform_weight           0.8
    bromoform_weight            1.2
    bromodichloromethane_weight 1.5
    dibromichloromethane_weight 0.7
  end

  factory :factor_weight2, class: FactorWeight do
    id                          2
    chloroform_weight           1.0
    bromoform_weight            1.0
    bromodichloromethane_weight 1.0
    dibromichloromethane_weight 1.0
  end

  factory :factor_weight3, class: FactorWeight do
    id                          3
    chloroform_weight           0.9
    bromoform_weight            1.1
    bromodichloromethane_weight 1.3
    dibromichloromethane_weight 0.6
  end

  factory :factor_weight4, class: FactorWeight do
    id                          4
    chloroform_weight           0.0
    bromoform_weight            1.0
    bromodichloromethane_weight 1.0
    dibromichloromethane_weight 1.7
  end

end
