module Puzzles
  class Node
    attr_reader :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end

    def to_s
      "Node(name: #{name}, id: #{id})"
    end
  end
end
