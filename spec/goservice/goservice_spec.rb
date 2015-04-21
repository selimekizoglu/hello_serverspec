require "spec_helper"
require "./spec/common_spec"
require "./spec/consul_agent_spec"

describe "goservice" do
  it_behaves_like "common"
  it_behaves_like "consul-agent"
  
  describe package("dnsmasq") do
    it { should be_installed.with_version("2.68-1") }
  end
  
  describe service("dnsmasq") do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe file("/etc/dnsmasq.conf") do
    it { should contain "address=/.istanbulcoders.dmz/127.0.0.1" }
  end
end
