# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :water_sample do
    id 1
    site 'LA Aquaduct Filteration Plant Effluent'
    chloroform 0.00104
    bromoform 0
    bromodichloromethane 0.00149
    dibromichloromethane 0.00275
  end

  factory :water_sample2, class: WaterSample do
    id 2
    site 'North Hollywood Pump Station (well blend)'
    chloroform 0.00291
    bromoform 0.00487
    bromodichloromethane 0.00547
    dibromichloromethane 0.0109
  end

  factory :water_sample3, class: WaterSample do
    id 3
    site 'Jensen Plant Effluent'
    chloroform 0.00065
    bromoform 0.00856
    bromodichloromethane 0.0013
    dibromichloromethane 0.00428
  end

  factory :water_sample4, class: WaterSample do
    id 4
    site 'Weymouth Plant Effluent'
    chloroform 0.00971
    bromoform 0.00317
    bromodichloromethane 0.00931
    dibromichloromethane 0.0116
  end

end
