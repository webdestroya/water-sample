require 'spec_helper'

describe WaterSample do
  describe '#find' do
    it 'verifies that finder returns the proper object' do
      FactoryGirl.create(:water_sample)
      FactoryGirl.create(:water_sample2)

      sample2 = WaterSample.find(2)
      sample2.should_not be_nil
      sample2.site.should == "North Hollywood Pump Station (well blend)"
      sample2.chloroform.should == 0.00291
      sample2.bromoform.should == 0.00487
      sample2.bromodichloromethane.should == 0.00547
      sample2.dibromichloromethane.should == 0.0109
    end
  end

  describe '#to_hash' do
    it 'ensures method exists' do
      FactoryGirl.build(:water_sample).should respond_to(:to_hash)
    end

    it 'converts hash without factors' do
      sample = FactoryGirl.create(:water_sample)

      # ensure that this factor is not included
      factor = FactoryGirl.create(:factor_weight)

      hash = sample.to_hash
      
      hash.should_not be_nil
      hash[:id].should eq(sample.id)
      hash[:site].should eq(sample.site)
      hash[:chloroform].should eq(sample.chloroform)
      hash[:bromoform].should eq(sample.bromoform)
      hash[:bromodichloromethane].should eq(sample.bromodichloromethane)
      hash[:dibromichloromethane].should eq(sample.dibromichloromethane)

      # we did not ask for factors
      hash["factor_#{factor.id}".to_sym].should be_nil
    end

    it 'converts hash with factors' do
      FactoryGirl.create(:factor_weight)
      FactoryGirl.create(:factor_weight2)
      FactoryGirl.create(:factor_weight3)
      FactoryGirl.create(:factor_weight4)
      sample = FactoryGirl.create(:water_sample)

      hash = sample.to_hash(true)

      FactorWeight.all.each do |fw|
        hash["factor_#{fw.id}".to_sym].should eq(sample.factor(fw.id))
      end
    end

    it 'does not include missing factors' do
      FactoryGirl.create(:factor_weight3)
      FactoryGirl.create(:factor_weight4)
      sample = FactoryGirl.create(:water_sample)

      sample_hash = sample.to_hash(true)

      sample_hash[:factor_1].should be_nil
      sample_hash[:factor_2].should be_nil
    end

    it 'ensures hash asking for factors when there are none' do
      sample = FactoryGirl.create(:water_sample)

      sample_hash = sample.to_hash(true)

      sample_hash.should_not be_nil
      sample_hash[:id].should eq(sample.id)
      sample_hash[:site].should eq(sample.site)
      sample_hash[:chloroform].should eq(sample.chloroform)
    end

  end

  describe '#factor' do
    it 'ensures method exists' do
      FactoryGirl.build(:water_sample).should respond_to(:factor)
    end

    it 'verifies factor calculation' do
      FactoryGirl.create(:factor_weight)
      sample = FactoryGirl.create(:water_sample)
      sample.factor(1).should eq(0.004992)
    end

    it 'validates the formula' do
      factor = FactoryGirl.create(:factor_weight)
      sample = FactoryGirl.create(:water_sample)

      weight = 0
      weight = weight + (sample.chloroform * factor.chloroform_weight)
      weight = weight + (sample.bromoform * factor.bromoform_weight)
      weight = weight + (sample.bromodichloromethane * factor.bromodichloromethane_weight)
      weight = weight + (sample.dibromichloromethane * factor.dibromichloromethane_weight)

      sample.factor(factor.id).should == weight
    end

    it 'nonexistant factor' do
      sample = FactoryGirl.create(:water_sample)

      expect { sample.factor(1) }.to raise_error
    end
  end

end
