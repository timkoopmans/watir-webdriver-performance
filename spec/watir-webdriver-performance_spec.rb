require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "WatirWebdriverPerformance" do

  let!(:b) { @b }

  before(:all) do
    @b ||= Watir::Browser.new
  end

  after(:all) do
    @b.close
  end

  it "should open get performance metrics from the browser" do
    b.goto "google.com"
    b.performance.should be_an_instance_of(OpenStruct)
  end

  it "should get summary data from the performance metrics" do
    # Summary metrics based on Processing Model of NavigationTiming
    # http://w3c-test.org/webperf/specs/NavigationTiming/#processing-model
    b.performance.summary.should include(:app_cache)
    b.performance.summary.should include(:dns)
    b.performance.summary.should include(:tcp_connection)
    b.performance.summary.should include(:request)
    b.performance.summary.should include(:response)
    b.performance.summary.should include(:dom_processing)
  end

  it "should get the summary metrics such as Response Time, TTLB and TTFB" do
    b.performance.summary.should include(:time_to_first_byte) # aka "server time"
    b.performance.summary.should include(:time_to_last_byte) # aka "network + server time"
    b.performance.summary.should include(:response_time)
  end

  it "should return true for chrome supported" do
    b.goto "google.com"
    b.should be_performance_supported
  end

  it "should support performance as block" do
    b.goto "google.com"
    b.with_performance {|performance| performance.should_not be_nil }
  end
end
