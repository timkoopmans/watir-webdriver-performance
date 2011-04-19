require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "WatirWebdriverPerformance" do

  let!(:b) { @b }

  before(:all) do
    @b ||= Watir::Browser.new :chrome
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

   it "should get summary data from the performance metrics for redirects" do
    b.goto "http://watirgrid.com"
    b.performance.summary.should include(:redirect)
  end

   it "should get summary data from the performance metrics for secure connections" do
    b.performance.summary.should include(:tcp_connection_secure)
  end

  it "should get the summary metrics such as Response Time, TTLB and TTFB" do
    b.performance.summary.should include(:time_to_first_byte) # aka "server time"
    b.performance.summary.should include(:time_to_last_byte) # aka "network + server time"
    b.performance.summary.should include(:response_time)
    puts "Page took #{b.performance.summary[:response_time]/1000} seconds to load"
  end

end
