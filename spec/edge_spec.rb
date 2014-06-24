require 'edge'

describe Edge do
  subject { described_class.new 10, 20, 30.5 }

  its(:node1_id) { should eq 10 }
  its(:node2_id) { should eq 20 }
  its(:weight) { should eq 30.5 }
end
