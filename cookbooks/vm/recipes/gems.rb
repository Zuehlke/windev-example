#
# Cookbook Name:: vm
# Recipe:: gems
#
# Author: var
#
# Copyright (c) 2014 Zühlke, All Rights Reserved.

cookbook_file "Gemfile" do
  path "#{ENV['TEMP']}/Gemfile"
  action :create
end

batch "bundle" do
  code <<-EOT
  set PATH=c:\\tools\\ruby\\bin;c:\\tools\\devkit\\bin;c:\\tools\\devkit\\mingw\\bin;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0
  call gem install bundler
  call bundle install
  EOT
  cwd ENV['TEMP']
end