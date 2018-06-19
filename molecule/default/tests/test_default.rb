# Molecule managed

describe file('/etc/hosts') do
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
end

describe docker_container(name: 'haproxy') do
  it { should exist }
  it { should be_running }
  its('ports') { should eq '0.0.0.0:80->80/tcp' }
end

describe file('/etc/haproxy/haproxy.cfg') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0644' }
end

describe http('http://localhost:80') do
  its('status') { should cmp 200 }
end
