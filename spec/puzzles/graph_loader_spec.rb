describe Puzzles::GraphLoader do
  let(:nodes_fixture) { File.expand_path('../../fixtures/nodes.csv',  __FILE__) }
  let(:edges_fixture) { File.expand_path('../../fixtures/edges.csv',  __FILE__) }

  describe '#load' do
    subject(:graph) { described_class.new(nodes_fixture, edges_fixture).load }

    context 'nodes' do
      its('nodes.count') { should eq 3 }

      it 'loads Advertising' do
        expect(graph.find_node(3637).name).to eq 'Advertising'
      end

      it 'loads Archaeological Method & Theory' do
        expect(graph.find_node(5346).name).to eq 'Archaeological Method & Theory'
      end

      it 'loads Computer Vision' do
        expect(graph.find_node(854).name).to eq 'Computer Vision'
      end
    end

    context 'edges' do
      its('edges.count') { should eq 2 }

      it 'loads Advertising -> Archaeological Method & Theory relation' do
        expect(graph.get_edges.find {|e| e.node1_id == 3637 && e.node2_id == 5346 }).to be_truthy
      end

      it 'loads Archaeological Method & Theory -> Computer Vision relation' do
        expect(graph.get_edges.find {|e| e.node1_id == 5346 && e.node2_id == 854 }).to be_truthy
      end
    end
  end
end
