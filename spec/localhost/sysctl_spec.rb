require 'spec_helper'

describe 'sysctl installation' do
  describe command('sysctl -V') do
    its(:stdout) { should match 'sysctl \(procps version 3.2.8\)' }
  end
end

describe 'sysctl commands are executed' do
  describe command('sysctl -a; sleep 5') do
    its(:stdout) { should include('kernel.sched_child_runs_first', 'kernel.sched_min_granularity_ns', 'net.core.warnings', 'cpt.suspend_timeout_sec' ) }
  end
end