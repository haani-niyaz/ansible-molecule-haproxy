# Molecule managed

describe file('/etc/hosts') do
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
end

describe http('https://localhost', ssl_verify: false) do
  its('status') { should cmp 200 }
end
