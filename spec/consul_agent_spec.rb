require 'spec_helper'
require './spec/common_spec'

shared_examples "consul-agent" do
  describe package("unzip") do
    it { should be_installed.with_version('6.0-9ubuntu1.3') }
  end

  describe file('/usr/local/bin/consul') do
    it { should be_file }
  end
end
