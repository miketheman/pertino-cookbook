require 'serverspec'

set :backend, :exec

puts "os: #{os}"

describe package('pertino-client') do
  it { should be_installed }
end

describe service('pgateway') do
  it { should be_running }
end

describe interface('pertino0'), skip: 'Needs valid credenitals.' do
  it { should exist }
end
