require 'node'

describe Node do
  subject { described_class.new 10, 'Example node' }

  its(:id) { should eq 10 }
  its(:name) { should eq 'Example node' }
end
