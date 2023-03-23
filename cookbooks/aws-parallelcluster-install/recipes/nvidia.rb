# frozen_string_literal: true

#
# Cookbook:: aws-parallelcluster
# Recipe:: nvidia
#
# Copyright:: 2013-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the
# License. A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

nvidia_driver 'Install nvidia driver'
include_recipe "aws-parallelcluster-install::cuda" unless redhat8?
include_recipe "aws-parallelcluster-install::gdrcopy" unless redhat8?
include_recipe "aws-parallelcluster-install::fabric_manager" unless redhat8?
