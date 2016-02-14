source 'https://supermarket.chef.io'

metadata

%w(
  pertino_client_test_device_auth
  pertino_client_test_remove
  pertino_client_test_user_auth
).each do |fixture|
  cookbook fixture, path: "test/fixtures/cookbooks/#{fixture}"
end
