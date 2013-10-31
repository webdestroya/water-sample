# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :water_sample do
    site "MyString"
    chloroform 1.5
    bromoform 1.5
    bromodichloromethane 1.5
    dibromichloromethane 1.5
  end
end
