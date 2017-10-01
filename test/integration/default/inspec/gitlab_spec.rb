control 'gitlab-ci-runner-1' do
  title 'Gitlab CI runner Setup'
  desc 'Check that jenkins is installed and listening to ports'
  describe package('gitlab-ci-multi-runner') do
    it { should be_installed }
  end

  describe service('gitlab-runner') do
   it { should be_installed }
   it { should be_running }
  end

  describe file('/etc/gitlab-runner/config.toml') do
    it { should be_file }
    its('content') { should match(%r{.*executor = "docker"}) }
    its('content') { should match(%r{.*token = "123456789"}) }
  end
end
