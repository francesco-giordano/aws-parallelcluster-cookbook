# frozen_string_literal: true

#
# Cookbook:: aws-parallelcluster
# Recipe:: neuron
#
# Copyright:: 2013-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the
# License. A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

return if node['cluster']['base_os'] == 'centos7' || arm_instance? || neuron_installed?

return if node['cluster']['base_os'] == 'centos7' || arm_instance? || neuron_installed?

if platform?('amazon')
  # add neuron repository
  yum_repository "neuron" do
    description "Neuron YUM Repository"
    baseurl node['cluster']['neuron']['base_url']
    gpgkey node['cluster']['neuron']['public_key']
    retries 3
    retry_delay 5
  end

elsif platform?('ubuntu')

  apt_repository 'neuron' do
    uri          node['cluster']['neuron']['base_url']
    components   ['main']
    key          node['cluster']['neuron']['public_key']
    retries 3
    retry_delay 5
  end

  apt_update
end

package 'aws-neuronx-dkms' do
  retries 3
  retry_delay 5
end

kernel_module 'neuron'
