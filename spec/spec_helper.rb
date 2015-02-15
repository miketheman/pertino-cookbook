require 'chefspec'
require 'chefspec/berkshelf'
require 'coveralls'

Coveralls.wear!

FAKE_API_KEY = '27c0206e-15aa-46b0-842e-3f216f11d8a5'
FAKE_USERNAME = 'myownuser@example.com'

RSpec.configure do |config|
  # run all specs when using a filter, but no spec match
  config.run_all_when_everything_filtered = true

  config.before do
    stub_data_bag_item('secrets', 'pertino_device_auth').and_return(
      id: 'pertino_device_auth',
      secret: FAKE_API_KEY
    )

    stub_command("grep -q #{FAKE_API_KEY} /opt/pertino/pgateway/conf/client.conf").and_return(false)
    stub_command("grep -q #{FAKE_USERNAME} /opt/pertino/pgateway/conf/client.conf").and_return(false)
  end

  shared_examples_for 'all platforms' do
    it 'runs the pertino_client resource' do
      expect(chef_run).to create_pertino_client('default')
    end
  end

  shared_examples_for 'all platforms inside provider' do
    it 'installs the client package' do
      expect(chef_run).to install_package('pertino-client')
    end

    it 'authenticates the client' do
      expect(chef_run).to run_execute('.pauth')
    end

    it 'starts and enables the pgateway service' do
      expect(chef_run).to enable_service('pgateway')
      expect(chef_run).to start_service('pgateway')
    end
  end

  shared_examples_for 'debianoids' do
    it 'sets up apt repo' do
      expect(chef_run).to add_apt_repository('pertino')
    end
  end

  shared_examples_for 'rhellions' do
    it 'sets up yum repo' do
      expect(chef_run).to create_yum_repository('pertino')
    end
  end
end

ChefSpec::Coverage.start!
