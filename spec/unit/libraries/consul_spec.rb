require 'spec_helper'

describe 'Chef::Consul' do
  describe '#remote_filename' do
    let(:version) { '0.5.2' }
    context 'when the OS is Linux' do
      let(:os) { 'linux' }
      {'i386' => '386', 'x86_64' => 'amd64'}.each do |machine_arch, consul_arch|
        context "with the architecture #{machine_arch}" do
          before(:each) do
            @node = {'os' => os, 'kernel' => {'machine' => machine_arch}, 'consul' => {'version' => version} }
          end
          it 'should retrieve binary based on architecture' do
            expect(Chef::Consul::remote_filename(@node)).to eq "#{version}_#{os}_#{consul_arch}"
          end
        end
      end
    end
  end
end
