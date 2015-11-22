#
# This file is not a directly invokable recipe. It is a function call that is
# meant to be invoked from other recipies that want to deploy a simple html
# website.
#
# Cookbook Name:: trion-cookbooks
# Recipe:: deploy_html_site
#
# Copyright (C) 2015 Karun Japhet
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :deploy_html_site do
  create_nginx_site_config params[:name]

  git_checkout_with_permissions params[:name] do
    www_root "#{node['trion']['default_www_root']}"
  end

  nginx_site node['trion']['sites'][params[:name]]['name'] do
    enable true
  end
end