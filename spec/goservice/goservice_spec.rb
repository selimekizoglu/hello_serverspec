require 'spec_helper'

describe group('go') do 
  it { should exist }
end

describe user('go') do 
  it { should exist }
  it { should belong_to_group 'go' }
end

describe file('/etc/sudoers') do
  it { should contain('go   ALL=(ALL:ALL) NOPASSWD: ALL') }
end

describe package('git') do
  it { should be_installed.with_version('1:1.9.1-1ubuntu0.1') }
end

describe package('dnsmasq') do
  it { should be_installed.with_version('2.68-1') }
end

describe service('dnsmasq') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/dnsmasq.conf') do
  it { should contain "address=/.istanbulcoders.dmz/127.0.0.1" }
end

describe file('/usr/local/bin/consul-agent') do
  it { should be_directory }
end

describe port(8080) do
  it { should be_listening }
end
