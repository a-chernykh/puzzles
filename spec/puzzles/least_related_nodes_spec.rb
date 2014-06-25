module Puzzles
  describe LeastRelatedNodes do
    let(:graph) { Graph.new }
    let(:least_related_nodes) { described_class.new graph }

    describe '#get' do
      subject { least_related_nodes.get(10).to_a }

      context 'no edges' do
        it { should be_empty }
      end

      context 'with edges' do
        let(:node1) { Node.new 1, 'Node #1' }
        let(:node2) { Node.new 2, 'Node #2' }
        let(:node3) { Node.new 3, 'Node #3' }
        let(:node4) { Node.new 4, 'Node #4' }
        let(:node5) { Node.new 5, 'Node #4' }

        let(:edge1) { Edge.new 1, 2, 1.55 }
        let(:edge2) { Edge.new 2, 3, 1.5  }
        let(:edge3) { Edge.new 3, 4, 1.75 }

        before do
          graph.add_node node1
          graph.add_node node2
          graph.add_node node3
          graph.add_node node4
          graph.add_node node5

          graph.add_edge edge1
          graph.add_edge edge2
          graph.add_edge edge3
        end

        it 'returns not connected pairs of nodes' do
          expect(subject).to eq [[node1, node5], [node2, node5], [node3, node5], [node4, node5]]
        end
      end
    end
  end
end
