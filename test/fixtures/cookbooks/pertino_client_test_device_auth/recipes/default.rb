# Example use of the resource

# Retrieve credentials from any source you like and pass them to the resource.
#
# @example
#   api_key_from_attribute = node['pertino']['network_api_key']
api_key_from_databag = data_bag_item('secrets', 'pertino_device_auth')['secret']

pertino_client 'default' do
  auth_mode 'api_key'
  api_key api_key_from_databag
end
