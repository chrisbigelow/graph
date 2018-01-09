require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []
  
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      top << vertex
    end
  end

  until top.empty?
    current = top.pop
    sorted << current
    current.out_edges.each do |edge|
      if edge.to_vertex.in_edges.empty?
        top << edge.to_vertex
      end
      edge.destroy!
    end
    vertices.delete(current)
  end
  sorted
end
