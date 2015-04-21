require 'spec_helper'
require './spec/common_spec'

shared_examples "consul-agent" do
  describe package("unzip") do
    it { should be_installed.with_version('6.0-9ubuntu1.3') }
  end

  describe file('/usr/local/bin/consul') do
    it { should be_file }
  end

  describe group("consul") do
    it { should exist }
  end

  describe user("consul") do
    it { should exist }
    it { should belong_to_group 'consul' }
  end

  describe file('/etc/sudoers') do
    it { should contain('go   ALL=(ALL:ALL) NOPASSWD: ALL') }
  end
end
