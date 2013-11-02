require 'spec_helper'

describe FactorWeight do
  it 'ensures proper creation' do
    FactorWeight.count.should == 0
    FactoryGirl.create(:factor_weight)
    FactorWeight.count.should == 1

    FactorWeight.find(1).id.should == 1
  end

  it 'ensures correct values' do
    oracle = FactoryGirl.build(:factor_weight)
    FactoryGirl.create(:factor_weight)

    factor = FactorWeight.find(1)

    factor.chloroform_weight.should == oracle.chloroform_weight
    factor.bromoform_weight.should == oracle.bromoform_weight
    factor.bromodichloromethane_weight.should == oracle.bromodichloromethane_weight
    factor.dibromichloromethane_weight.should == oracle.dibromichloromethane_weight
  end

end
