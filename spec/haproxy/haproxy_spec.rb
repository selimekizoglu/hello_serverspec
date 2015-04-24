require "spec_helper"
require "./spec/common_spec"
require "./spec/consul_agent_spec"

describe "haproxy" do
  it_behaves_like "common"
  it_behaves_like "consul-agent"

  describe package("haproxy") do
    it { should be_installed.with_version('1.5.11-1ppa1~trusty') }
  end

  describe service("haproxy") do
    it { should be_enabled }
    it { should be_running }
  end
end
