require "spec_helper"
require "./spec/common_spec"
require "./spec/consul_spec"

describe "haproxy" do
  it_behaves_like "common"
  it_behaves_like "consul"

  describe command('hostname') do
    its(:stdout) { should match /haproxy/ }
  end

  describe package("haproxy") do
    it { should be_installed.with_version('1.5.11-1ppa1~trusty') }
  end

  describe service("haproxy") do
    it { should be_enabled }
    it { should be_running }
  end
end
