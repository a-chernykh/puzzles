module Puzzles
  describe Algorithms::Dijkstra do
    describe '#shortest_paths' do
      let(:graph)     { Graph.new }

      before do
        graph.add_node Node.new 1, 'Node #1'
        graph.add_node Node.new 2, 'Node #2'
        graph.add_node Node.new 3, 'Node #3'
        graph.add_node Node.new 4, 'Node #4'

        graph.add_edge Edge.new 1, 2, 1
        graph.add_edge Edge.new 2, 3, 1
      end

      subject { dijkstra.shortest_paths }

      describe 'from Node #1' do
        let(:dijkstra)  { described_class.new graph, graph.find_node(1) }
        
        its([1]) { should eq 0 }
        its([2]) { should eq 1 }
        its([3]) { should eq 2 }
        its([4]) { should eq Float::INFINITY }
      end

      describe 'from Node #2' do
        let(:dijkstra)  { described_class.new graph, graph.find_node(2) }
        
        its([1]) { should eq 1 }
        its([2]) { should eq 0 }
        its([3]) { should eq 1 }
        its([4]) { should eq Float::INFINITY }
      end

      describe 'from Node #3' do
        let(:dijkstra)  { described_class.new graph, graph.find_node(3) }
        
        its([1]) { should eq 2 }
        its([2]) { should eq 1 }
        its([3]) { should eq 0 }
        its([4]) { should eq Float::INFINITY }
      end

      describe 'from Node #4' do
        let(:dijkstra)  { described_class.new graph, graph.find_node(4) }
        
        its([1]) { should eq Float::INFINITY }
        its([2]) { should eq Float::INFINITY }
        its([3]) { should eq Float::INFINITY }
        its([4]) { should eq 0 }
      end
    end
  end
end
