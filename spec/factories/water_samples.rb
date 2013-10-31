# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :water_sample do
    id 1
    site "LA Aquaduct Filteration Plant Effluent"
    chloroform 0.00104
    bromoform 0
    bromodichloromethane 0.00149
    dibromichloromethane 0.00275
  end

  factory :water_sample2, :class => WaterSample do
    id 2
    site "North Hollywood Pump Station (well blend)"
    chloroform 0.00291
    bromoform 0.00487
    bromodichloromethane 0.00547
    dibromichloromethane 0.0109
  end

end
