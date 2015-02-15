describe 'pertino_client_test_device_auth on ubuntu-12.04' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'ubuntu',
      version: '12.04',
      step_into: 'pertino_client'
    ).converge('pertino_client_test_device_auth')
  end

  context 'run resource' do
    it_behaves_like 'all platforms'

    context 'enter provider' do
      it_behaves_like 'all platforms inside provider'
      it_behaves_like 'debianoids'
    end
  end
end
