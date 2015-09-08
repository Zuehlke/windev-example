#
# Cookbook Name:: vm
# Recipe:: default
#
# Author: var
#
# Copyright (c) 2014 Zühlke, All Rights Reserved.

include_recipe 'windev::features'
include_recipe 'windev::drivers'
include_recipe 'windev::packages'
include_recipe 'windev::environment'
