describe 'pertino_client_test_remove' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(
      step_into: 'pertino_client'
    ).converge(described_recipe)
  end

  context 'run resource' do
    it 'deletes the pertino_client resource' do
      expect(chef_run).to delete_pertino_client('default')
    end

    context 'enter provider' do
      it 'removes the pertino-client package' do
        expect(chef_run).to remove_package('pertino-client')
      end
    end
  end
end
