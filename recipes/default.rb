#
# Cookbook Name:: Cgroups
# Recipe:: default
#
# Author:: Eugenio Marzo <eugenio.marzo@yahoo.it>
# Copyright 2012, Eugenio Marzo
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "libcgroup" do
  action :install
end

template "/etc/cgconfig.conf" do
   source "cgconfig.conf.erb"
   variables({ :controllers => node[:cgroups][:controllers],
               :groups => node[:cgroups][:groups] })
end



template "/etc/cgrules.conf" do
  source "cgrules.conf.erb"
  variables({
              :users => node[:cgroups][:users]
            })
end

service "cgconfig" do
  action :start
  subscribes :restart, resources(:template => [ "/etc/cgconfig.conf" ]), :delayed
end

service "cgred" do
  action :start
  subscribes :restart, resources(:template => [ "/etc/cgconfig.conf", "/etc/cgrules.conf" ]), :delayed
end
