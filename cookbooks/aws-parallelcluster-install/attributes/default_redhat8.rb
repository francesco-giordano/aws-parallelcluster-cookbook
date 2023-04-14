# RedHat 8 default attributes for aws-parallelcluster-install

return unless platform?('redhat') && node['platform_version'].to_i == 8

# environment-modules required by EFA, Intel MPI and ARM PL
# Removed libssh2-devel from base_packages since is not shipped by RedHat 8 and in conflict with package libssh-0.9.6-3.el8.x86_64
# iptables needed for IMDS setup
default['cluster']['base_packages'] = %w(vim ksh tcsh zsh openssl-devel ncurses-devel pam-devel net-tools openmotif-devel
                                             libXmu-devel hwloc-devel libdb-devel tcl-devel automake autoconf pyparted libtool
                                             httpd boost-devel redhat-lsb mlocate R atlas-devel
                                             blas-devel libffi-devel dkms libedit-devel
                                             libical-devel postgresql-devel postgresql-server sendmail libxml2-devel libglvnd-devel
                                             mdadm python2 python2-pip libgcrypt-devel libevent-devel glibc-static bind-utils
                                             iproute NetworkManager-config-routing-rules python3 python3-pip iptables libcurl-devel yum-plugin-versionlock
                                             coreutils moreutils curl environment-modules gcc gcc-c++ bzip2)

# Needed by hwloc-devel blas-devel libedit-devel and glibc-static packages
default['cluster']['extra_repos'] = 'codeready-builder-for-rhel-8-rhui-rpms'

default['cluster']['kernel_devel_pkg']['name'] = "kernel-devel"
default['cluster']['kernel_devel_pkg']['version'] = node['kernel']['release']

default['cluster']['chrony']['conf'] = "/etc/chrony.conf"

# Arm Performance Library
default['cluster']['armpl']['major_minor_version'] = '21.0'
default['cluster']['armpl']['patch_version'] = '0'
default['cluster']['armpl']['version'] = "#{node['cluster']['armpl']['major_minor_version']}.#{node['cluster']['armpl']['patch_version']}"

default['cluster']['armpl']['gcc']['major_minor_version'] = '9.3'
default['cluster']['armpl']['gcc']['patch_version'] = '0'
default['cluster']['armpl']['gcc']['url'] = [
  'https://ftp.gnu.org/gnu/gcc',
  "gcc-#{node['cluster']['armpl']['gcc']['major_minor_version']}.#{node['cluster']['armpl']['gcc']['patch_version']}",
  "gcc-#{node['cluster']['armpl']['gcc']['major_minor_version']}.#{node['cluster']['armpl']['gcc']['patch_version']}.tar.gz",
].join('/')
default['cluster']['armpl']['platform'] = 'RHEL-8'
default['cluster']['armpl']['url'] = [
  'archives/armpl',
  node['cluster']['armpl']['platform'],
  "arm-performance-libraries_#{node['cluster']['armpl']['version']}_#{node['cluster']['armpl']['platform']}_gcc-#{node['cluster']['armpl']['gcc']['major_minor_version']}.tar",
].join('/')
