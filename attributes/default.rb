default[:cgroups][:controllers] = {
  'cpuset' => "/cgroup/cpuset",
  'cpu' => "/cgroup/cpu",
  'cpuacct' => "/cgroup/cpuacct",
  'memory' => "/cgroup/memory",
  'devices' => "/cgroup/devices",
  'freezer' => "/cgroup/freezer",
  'net_cls' => "/cgroup/net_cls",
  'blkio' => "/cgroup/blkio"
}

default[:cgroups][:groups] = {}

default[:cgroups][:users] = {}
