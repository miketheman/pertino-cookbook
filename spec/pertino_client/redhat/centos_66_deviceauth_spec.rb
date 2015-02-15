describe 'pertino_client_test_device_auth on centos-6.6' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '6.6',
      step_into: 'pertino_client'
    ).converge('pertino_client_test_device_auth')
  end

  context 'run resource' do
    it_behaves_like 'all platforms'

    context 'enter provider' do
      it_behaves_like 'all platforms inside provider'
      it_behaves_like 'rhellions'
    end
  end
end
