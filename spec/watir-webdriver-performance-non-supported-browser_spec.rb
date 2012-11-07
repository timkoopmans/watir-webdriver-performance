require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "WatirWebdriverPerformance-NonSupportedBrowser" do

  let!(:b) { @b }

  before(:all) do
    @b ||= Watir::Browser.new :firefox
  end

  after(:all) do
    @b.close
  end

  pending "should raise an error when a non supported browser is encountered" do
    b.goto "google.com"
    lambda {  b.performance }.should raise_error RuntimeError, 'Could not collect performance metrics from your current browser. Please ensure the browser you are using supports collecting performance metrics.'
  end

  pending "should return false for supported" do
    b.goto "google.com"
    b.should_not be_performance_supported
  end

  pending "should not support performance as block" do
    b.goto "google.com"
    b.with_performance {|performance| performance.should be_nil }
  end
end
