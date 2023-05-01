require 'spec_helper'

describe 'hrb_vuln_cb::default' do
  context 'When the "silverlight_exception" tag is present, on Windows 2016' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
      runner.node.normal['tags'] = ['silverlight_exception'] # rubocop:disable Chef/Correctness/NodeNormal
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'does not remove Silverlight' do
      expect(chef_run).to_not remove_windows_package('Microsoft Silverlight')
    end
  end
end
