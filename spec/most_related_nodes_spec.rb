require 'most_related_nodes'
require 'graph'
require 'edge'
require 'node'

describe MostRelatedNodes do
  let(:graph) { Graph.new }
  let(:most_related_nodes) { described_class.new graph }

  describe '#get' do

    subject { most_related_nodes.get.to_a }

    context 'no edges' do
      it { should be_empty }
    end

    context 'with edges' do
      let(:node1) { Node.new 1, 'Node #1' }
      let(:node2) { Node.new 2, 'Node #2' }
      let(:node3) { Node.new 3, 'Node #3' }

      let(:edge1) { Edge.new 1, 2, 1.55 }
      let(:edge2) { Edge.new 2, 3, 1.5 }
      let(:edge3) { Edge.new 3, 1, 1.75 }

      before do
        graph.add_node node1
        graph.add_node node2
        graph.add_node node3

        graph.add_edge edge1
        graph.add_edge edge2
        graph.add_edge edge3
      end

      it 'orders edges by weight descending' do
        expect(subject.map { |pair| pair[0] }).to eq [node3, node1, node2]
        expect(subject.map { |pair| pair[1] }).to eq [node1, node2, node3]
        expect(subject.map { |pair| pair[2] }).to eq [1.75, 1.55, 1.5]
      end
    end
  end
end
