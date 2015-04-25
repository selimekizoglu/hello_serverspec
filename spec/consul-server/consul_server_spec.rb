require "spec_helper"
require "./spec/consul_spec"

describe "consul-server" do
  it_behaves_like "consul"

  describe command('hostname') do
    its(:stdout) { should match /consul-1/ }
  end
end
