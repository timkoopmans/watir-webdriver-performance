require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "WatirWebdriverPerformance" do

  let!(:b) { @b }

  before(:all) do
    @b ||= Watir::Browser.new :chrome
  end

  after(:all) do
    @b.close
  end

  pending "should open and get performance metrics from the FF7 browser" do
    b.goto "google.com"
    b.performance.should be_an_instance_of(OpenStruct)
  end

end