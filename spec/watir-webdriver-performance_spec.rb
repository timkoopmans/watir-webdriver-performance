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
    expect(b.performance).to be_an_instance_of(OpenStruct)
  end

  it "should get summary data from the performance metrics" do
    # Summary metrics based on Processing Model of NavigationTiming
    # http://w3c-test.org/webperf/specs/NavigationTiming/#processing-model
    expect(b.performance.summary).to include(:app_cache)
    expect(b.performance.summary).to include(:dns)
    expect(b.performance.summary).to include(:tcp_connection)
    expect(b.performance.summary).to include(:request)
    expect(b.performance.summary).to include(:response)
    expect(b.performance.summary).to include(:dom_processing)
  end

  it "should get the summary metrics such as Response Time, TTLB and TTFB" do
    expect(b.performance.summary).to include(:time_to_first_byte) # aka "server time"
    expect(b.performance.summary).to include(:time_to_last_byte) # aka "network + server time"
    expect(b.performance.summary).to include(:response_time)
  end

  it "should return true for chrome supported" do
    b.goto "google.com"
    expect(b).to be_performance_supported
  end

  it "should support performance as block" do
    b.goto "google.com"
    b.with_performance {|performance| expect(performance).not_to be_nil }
  end
end
