require "spec_helper"
require "./spec/common_spec"
require "./spec/consul_spec"

describe "goservice" do
  it_behaves_like "common"
  it_behaves_like "consul"

  describe command('hostname') do
    its(:stdout) { should match /goservice-1/ }
  end
  
  describe package("dnsmasq") do
    it { should be_installed.with_version("2.68-1") }
  end
  
  describe service("dnsmasq") do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe file("/etc/dnsmasq.conf") do
    it { should contain "address=/.istanbulcoders.dmz/192.168.50.20" }
  end
end
