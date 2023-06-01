# Common attributes shared between multiple cookbooks

# Base dir

default['cluster']['head_node_home_path'] = '/home'
default['cluster']['shared_dir_compute'] = node['cluster']['shared_dir']
default['cluster']['shared_dir_head'] = node['cluster']['shared_dir']

default['cluster']['ebs_shared_dirs'] = '/shared'
default['cluster']['exported_ebs_shared_dirs'] = node['cluster']['ebs_shared_dirs']

# IMDS
default['cluster']['head_node_imds_secured'] = 'true'
default['cluster']['head_node_imds_allowed_users'] = ['root', node['cluster']['cluster_admin_user'], node['cluster']['cluster_user'] ]
default['cluster']['head_node_imds_allowed_users'].append('dcv') if node['cluster']['dcv_enabled'] == 'head_node'
default['cluster']['head_node_imds_allowed_users'].append(lazy { node['cluster']['scheduler_plugin']['user'] }) if node['cluster']['scheduler'] == 'plugin'

default['cluster']['computefleet_status_path'] = "#{node['cluster']['shared_dir']}/computefleet-status.json"
default['cluster']['head_node_private_ip'] = nil
