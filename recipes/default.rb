#
# Cookbook:: silverlight
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

# tag('silverlight_exception')

unless tagged?('silverlight_exception')
  windows_package 'Microsoft Silverlight' do
    action :remove
  end
end

node.default['hrb']['vuln']['silverlight']['uninstall'] = false if tagged?('silverlight_exception')

# Remove Microsoft Silverlight
return unless node['hrb']['vuln']['silverlight']['uninstall'].eql? true
windows_package 'Microsoft Silverlight' do
  action :remove
end
