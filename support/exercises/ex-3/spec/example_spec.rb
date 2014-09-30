require_relative 'spec_helper'

describe package('tmux') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end
