require 'graph'
require 'node'
require 'edge'

describe Graph do
  let(:graph) { described_class.new }

  describe '#add_node' do
    let(:node) { Node.new 1, 'Node #1' }

    before { graph.add_node node }

    it 'adds node to the list' do
      expect(graph.get_nodes).to eq [node]
    end

    it 'does not adds node twice' do
      graph.add_node Node.new 1, 'Node #1'
      expect(graph.get_nodes).to eq [node]
    end
  end

  describe '#find_node' do
    subject { graph.find_node node.id }

    let(:node) { Node.new 1, 'Node #1' }

    context 'node in graph' do
      before { graph.add_node node }

      it { should eq node }
    end

    context 'node not in graph' do
      it { should be_nil }
    end
  end

  describe '#add_edge' do
    let(:edge) { Edge.new 1, 2, 3.5 }

    before { graph.add_edge edge }

    it 'adds edge to the list' do
      expect(graph.get_edges).to eq [edge]
    end

    it 'does not adds edge twice' do
      graph.add_edge Edge.new 1, 2, 4.5
      expect(graph.get_edges).to eq [edge]
    end
  end

  describe '#get_nodes' do
    let(:node1) { Node.new 1, 'Node #1' }
    let(:node2) { Node.new 2, 'Node #2' }

    before do
      graph.add_node node1
      graph.add_node node2
    end

    subject { graph.get_nodes }

    it { should eq [node1, node2] }
  end

  describe '#get_edges' do
    let(:edge1) { Edge.new 1, 2, 3.5 }
    let(:edge2) { Edge.new 2, 3, 4.5 }

    before do
      graph.add_edge edge1
      graph.add_edge edge2
    end

    subject { graph.get_edges }

    it { should eq [edge1, edge2] }
  end
end
