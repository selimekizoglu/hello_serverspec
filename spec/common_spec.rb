require "spec_helper"

shared_examples "common" do
  describe group("go") do 
    it { should exist }
  end
  
  describe user("go") do 
    it { should exist }
    it { should belong_to_group "go" }
  end
  
  describe file("/etc/sudoers") do
    it { should contain("go   ALL=(ALL:ALL) NOPASSWD: ALL") }
  end
  
  describe package("git") do
    it { should be_installed.with_version("1:1.9.1-1ubuntu0.1") }
  end
end
