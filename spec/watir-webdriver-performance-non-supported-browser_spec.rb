require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "WatirWebdriverPerformance-NonSupportedBrowser" do

  let!(:b) { @b }

  before(:all) do
    @b ||= Watir::Browser.new :firefox
  end

  after(:all) do
    @b.close
  end

  it "should raise an error when a non supported browser is encountered" do
    b.goto "google.com"
    lambda {  b.performance }.should raise_error RuntimeError, 'Could not collect performance metrics from your current browser. Please ensure the browser you are using supports collecting performance metrics.'
  end

end
